# Relay Clip Development Guide

Building a Relay Clip is a departure from traditional mobile development. Instead of building for a restricted mobile device, you are building for the **Relay Shell** which acts as a window into your powerful host machine.

## Architecture

A Relay Clip consists of:
1. **Frontend**: A React-based UI that runs in the Relay Shell (Mobile/Web).
2. **Runtime**: The Relay Helper (Desktop) which provides system access (FS, Terminal, CPU).
3. **Communication**: A secure, real-time bridge between the two.

## Prerequisite: Relay SDK

The SDK provides the building blocks for your Clip:
- `useFileSystem()`: Direct access to allowed host directories.
- `useTerminal()`: Create and interact with shell sessions.
- `useNotification()`: Trigger system and shell-level alerts.

## Creating Your First Clip

### 1. Initialize
Run the following command to bootstrap a new project:
```bash
relay create-app my-new-clip
```

### 2. Development Mode
Start the dev server to see changes in real-time on your mobile device:
```bash
cd my-new-clip
relay dev
```
Open the Relay Shell on your phone, and your local app will appear in the developer section.

### 3. Accessing the System
Unlike Expo or Native apps, Clips can reach back to your Mac. For example, to read a file:

```typescript
import { useFileSystem } from '@relay/sdk';

const MyComponent = () => {
  const { readFile } = useFileSystem();
  
  const handleRead = async () => {
    const content = await readFile('~/Documents/info.txt');
    console.log(content);
  };
}
```

## Packaging for Distribution

Once your app is ready, package it into a `.rly` bundle:
```bash
relay build
```
This produces a minified, optimized bundle that is ready to be submitted to the Clips Store.

## Submission Process

1. Fork the `clips` repository.
2. Place your bundle in `clips/rly/`.
3. Place your icon in `clips/assets/`.
4. Update the `store.json` following the existing schema.
5. Submit a Pull Request.

Building for Relay means your users get desktop-class power with mobile-class portability.
