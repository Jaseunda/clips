# Relay Clips

**Empowering your mobile with the raw power of your Mac.**

Clips are a new generation of ultra-lightweight applications designed for the Relay platform. While modern legacy apps often bloat to hundreds of megabytes, a Relay Clip delivers the same core functionality in just **2MB**.

The vision is simple: move the heavy processing to your desktop machine while interacting through a fluid, beautiful interface on your mobile. This allows you to handle complex AI tasks, massive builds, and system-level operations on the go, without draining your phone's battery or storage.

---

## Comparison: Relay Clips vs. Legacy Mobile (Expo/Native)

| Feature | Legacy Mobile (Expo) | Relay Clips |
| :--- | :--- | :--- |
| **Download Size** | 50MB - 1GB+ | ~2MB |
| **Battery Impact** | Heavy (Local CPU) | Minimal (Remote Execution) |
| **Processing Power** | Limited to Mobile ARM | Unlimited Desktop i9/M3/GPU |
| **Development Speed** | Slow Builds / Complexity | Instant Hot Reload / SDK-First |
| **Data Privacy** | Cloud-Dependent | Network-Local / Privacy-Native |
| **Functionality** | Sandbox Restricted | Full System Access (via Helper) |

---

## The Relay Helper

To unlock the full potential of Clips—including terminal access, local file management, and CPU-intensive tasks—you need the Relay Helper running on your host machine.

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

## Developing Clips

Creating a Clip is faster and simpler than building a traditional app. With the Relay SDK, you can go from idea to installed in minutes.

1. **Setup**: Ensure you have the Relay Helper installed.
2. **Scaffold**: Run `relay create-app <name>` in your terminal.
3. **Build**: Use React and the Relay SDK to build your interface.
4. **Deploy**: Run `relay build` to generate your `.rly` bundle.

See [DEVELOPMENT.md](./DEVELOPMENT.md) for a full guide on building your first Clip.

---

## Contributing to the Store

We are building a community-driven ecosystem where users share tools that empower everyone. 

1. Build your Clip.
2. Fork this repository.
3. Add your `.rly` bundle and metadata to the `clips/` directory.
4. Update `store.json` with your app details.
5. Open a Pull Request.

---

## Getting Started

1. **Host**: Install the Relay Helper on your machine using the commands above.
2. **Terminal**: Run `relay start` to begin broadcasting.
3. **Mobile**: Open the [Relay Shell](https://relay.notapublicfigureanymore.com) on your phone.
4. **Connect**: Scan the QR code in your terminal to pair your devices.
5. **Install**: Browse the Clips Store and grab the tools you need.

---

*Built for the future of distributed computing.*
