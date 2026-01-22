# Relay Clip Development Guide

Building a Relay Clip is a departure from traditional mobile development. Instead of building for a restricted mobile device, you are building for the **Relay Shell**.

Clips run **locally and offline** by default. They only use the network when you explicitly request "Pro" power from your Relay Helper.

## Architecture

1. **Frontend**: A React-based UI that runs in the Relay Shell.
2. **Offline Runtime**: Fast, local execution for basic tasks.
3. **Helper Bridge**: Connection to your Mac/PC for Terminal, FS, and heavy CPU tasks.

## Relay CLI: The Command Center

The `relay` command is your primary tool for development and management.

| Command | Usage | Description |
| :--- | :--- | :--- |
| **`relay create-app <name>`** | `relay create-app my-tool` | Scaffolds a new Clip project with the SDK. |
| **`relay dev`** | `relay dev` | Starts a hot-reloading dev server for mobile testing. |
| **`relay build`** | `relay build` | Compiles your app into a high-performance `.rly` bundle. |
| **`relay install [file]`** | `relay install tools.rly` | Installs a bundle locally for testing. |
| **`relay apps`** | `relay apps` | Lists all your installed Clips. |
| **`relay uninstall <name>`** | `relay uninstall my-tool` | Removes a Clip from your local environment. |
| **`relay status`** | `relay status` | Checks if the Helper server is currently running. |
| **`relay start`** | `relay start` | Launches the Helper in daemon mode. |
| **`relay stop`** | `relay stop` | Safely shuts down the Helper daemon. |
| **`relay help`** | `relay help` | Displays all available commands and flags. |

## Development Lifecycle

### 1. Scaffold
```bash
relay create-app my-new-clip
```

### 2. Develop
Start the dev server:
```bash
relay dev
```
Open the Relay Shell on your phone. Your local app will automatically appear in the **Developer Section** for instant testing.

### 3. Reach the Host (Pro Power)
To use your Mac's power from your phone:
```typescript
import { useTerminal } from '@relay/sdk';

const ShellAction = () => {
  const { exec } = useTerminal();
  
  const handleBuild = async () => {
    // This runs on your MAC, not your phone!
    const result = await exec('npm run production-build');
    console.log(result.stdout);
  };
}
```

### 4. Build & Share
When ready, build your bundle:
```bash
relay build
```
Now you're ready to share it! See [CONTRIBUTING.md](./CONTRIBUTING.md) to learn how to add your work to the official Clips Store.
