# Contributing to Relay Clips

We are building a community-driven ecosystem where users share tools that empower everyone. This guide covers how to submit your built Clip to the store.

## Prerequisites

1. Create and build your app using the [Development Guide](./DEVELOPMENT.md).
2. Ensure you have your generated `.rly` bundle and high-quality screenshots.

## Submission Process

### 1. Fork and Prepare
Fork this repository and create a new branch for your app.

### 2. Organize Assets
Place your files in their dedicated directories:
- **Bundles**: `clips/rly/your-app.rly`
- **Icons**: `clips/assets/your-app-icon.png`
- **Screenshots**: `clips/assets/screenshots/...`

### 3. Register in the Store
Update `store.json` by adding your entry to the `apps` array. Ensure your `downloadUrl` and `iconUrl` point to your raw GitHub assets on your fork (or the main repo once merged).

```json
{
  "bundleId": "com.author.appname",
  "name": "App Name",
  "description": "Powerful tool for...",
  "version": "1.0.0",
  "sizeBytes": 204800,
  "downloadUrl": "...",
  "iconUrl": "...",
  "author": "Your Name",
  "category": "Utilities",
  "license": "MIT"
}
```

### 4. Open a Pull Request
Submit your PR with a clear description and screenshots of the app in action.

## Quality Standards
- **Size**: Bundles should remain optimized (ideally < 5MB).
- **Offline**: Basic functionality must work without a Helper connection.
- **Power**: Use the Helper bridge for heavy lifting—don't overload the mobile CPU.

*Together we empower mobile devices with the soul of a desktop.*
