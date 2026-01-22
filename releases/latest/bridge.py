#!/usr/bin/env python3
"""
PTY Bridge for Relay Terminal
Uses Python's pty module to create a real pseudo-terminal
and bridges I/O between Node.js child_process and the shell.
"""

import os
import pty
import sys
import select
import subprocess
import struct
import fcntl
import termios
import signal

def set_winsize(fd, row, col, xpix=0, ypix=0):
    """Set the window size of the PTY."""
    winsize = struct.pack("HHHH", row, col, xpix, ypix)
    fcntl.ioctl(fd, termios.TIOCSWINSZ, winsize)

def set_nonblocking(fd):
    """Set a file descriptor to non-blocking mode."""
    flags = fcntl.fcntl(fd, fcntl.F_GETFL)
    fcntl.fcntl(fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)

def main():
    # Get shell from argument or environment
    shell = sys.argv[1] if len(sys.argv) > 1 else os.environ.get('SHELL', '/bin/zsh')
    
    # Create PTY pair
    master_fd, slave_fd = pty.openpty()
    
    # Set initial terminal size
    try:
        set_winsize(master_fd, 24, 80)
    except Exception:
        pass

    # Spawn shell process
    pid = os.fork()
    
    if pid == 0:
        # Child process
        os.close(master_fd)
        os.setsid()
        
        # Make slave the controlling terminal
        os.dup2(slave_fd, 0)  # stdin
        os.dup2(slave_fd, 1)  # stdout
        os.dup2(slave_fd, 2)  # stderr
        
        if slave_fd > 2:
            os.close(slave_fd)
        
        # Set TERM environment
        os.environ['TERM'] = 'xterm-256color'
        
        # Execute shell
        os.execvp(shell, [shell])
    else:
        # Parent process
        os.close(slave_fd)
        
        # Set stdin to non-blocking
        stdin_fd = sys.stdin.fileno()
        set_nonblocking(stdin_fd)
        set_nonblocking(master_fd)
        
        try:
            while True:
                # Check if child is still alive
                result = os.waitpid(pid, os.WNOHANG)
                if result[0] != 0:
                    break
                
                # Wait for readable file descriptors
                try:
                    # select can be interrupted by signals, catch that
                    readable, _, _ = select.select([stdin_fd, master_fd], [], [], 0.5)
                except (select.error, InterruptedError):
                    continue
                
                if master_fd in readable:
                    # Read from shell, write to stdout
                    try:
                        data = os.read(master_fd, 10240)
                        if not data: # EOF from PTY
                            break
                        os.write(sys.stdout.fileno(), data)
                        sys.stdout.flush()
                    except OSError:
                        break
                
                if stdin_fd in readable:
                    # Read from stdin, write to shell
                    try:
                        data = os.read(stdin_fd, 10240)
                        if not data: # EOF from parent (stdin closed)
                            break
                        os.write(master_fd, data)
                    except OSError as e:
                        if e.errno == 11:  # EAGAIN - no data available
                            continue
                        break
                        
        except (KeyboardInterrupt, EOFError):
            pass
        finally:
            os.close(master_fd)
            try:
                # Kill the session shell process group if it still exists
                os.killpg(os.getpgid(pid), signal.SIGTERM)
            except Exception:
                try:
                    os.kill(pid, signal.SIGTERM)
                except Exception:
                    pass
            
            # Final wait to reap the child
            try:
                os.waitpid(pid, 0)
            except Exception:
                pass

if __name__ == "__main__":
    main()
