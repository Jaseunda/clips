# Relay Clips

**Empowering your mobile with the raw power of your Mac.**

Clips are a new generation of ultra-lightweight applications designed for the Relay platform. While modern legacy apps often bloat to hundreds of megabytes, a Relay Clip delivers the same core functionality in just **2MB**.

### Offline First, Desktop Powered
Relay Clips run **entirely locally and offline** on your device by default. However, when you need more power—like running a full terminal, managing massive file systems, or executing AI workloads—you simply connect to your machine via the **Relay Helper**.

This architecture gives you desktop-class performance and i9/M3 processing power on your phone, without the battery-draining weight of legacy software.

[Learn more about the Relay Vision and Legacy Comparison](./VISION.md)

---

## The Relay Helper

The Helper is your gateway to "Pro" features. Use it to bridge your mobile device to your computer's terminal, file system, and hardware.

### One-Line Installation

**macOS / Linux**
```bash
curl -fsSL https://raw.githubusercontent.com/Jaseunda/clips/main/releases/install.sh | bash
```

**Windows (PowerShell)**
```powershell
iwr -useb https://raw.githubusercontent.com/Jaseunda/clips/main/releases/install.ps1 | iex
```

---

## Getting Started

1. **Host (Optional)**: If you need system power, install the Relay Helper using the commands above.
2. **Terminal**: Run `relay start` on your machine.
3. **Mobile**: Open the [Relay Shell](https://clips.notapublicfigureanymore.com) on your phone.
4. **Connect**: Scan the QR code to pair.
5. **Install**: Browse the Clips Store and grab the tools you need.

---

## Developing & Contributing

We have built the Relay CLI to make app creation as easy as writing a simple script. From bootstrapping to store submission, the process is seamless.

- **Build**: [DEVELOPMENT.md](./DEVELOPMENT.md) - Learn how to use the SDK and CLI commands.
- **Submit**: [CONTRIBUTING.md](./CONTRIBUTING.md) - Learn how to share your tool with the community.

*Built for the future of distributed computing.*
