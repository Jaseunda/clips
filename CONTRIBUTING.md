# Contributing to Relay Clips

Thanks for building for Relay! Here's how to submit your app to the store.

## Requirements

- Your app must be built with the Relay SDK
- Bundle must be a valid `.rly` file
- App must work offline (no external dependencies that break without internet)
- No malicious code, ads, or tracking

## Submission Process

### 1. Fork this repository

### 2. Add your `.rly` file

Place your bundle in the `clips/` folder:
```
clips/
└── your-app-name.rly
```

### 3. Update `store.json`

Add your app entry to the `apps` array:

```json
{
  "bundleId": "com.yourname.appname",
  "name": "Your App Name",
  "description": "A short description of your app",
  "version": "1.0.0",
  "sizeBytes": 245760,
  "iconUrl": "base64-encoded-png...",
  "downloadUrl": "https://raw.githubusercontent.com/Jaseunda/clips/main/clips/your-app-name.rly",
  "screenshotUrls": [
    "https://example.com/screenshot1.png",
    "https://example.com/screenshot2.png"
  ],
  "author": "Your Name",
  "category": "Utilities",
  "license": "MIT"
}
```

**Fields:**
| Field | Required | Description |
|-------|----------|-------------|
| `bundleId` | ✅ | Unique reverse-domain ID (e.g., `com.yourname.app`) |
| `name` | ✅ | Display name |
| `description` | ✅ | Short description (max 120 chars) |
| `version` | ✅ | Semver version |
| `sizeBytes` | ✅ | File size in bytes |
| `iconUrl` | ✅ | Base64-encoded PNG (88x88 recommended) |
| `downloadUrl` | ✅ | Raw GitHub URL to your `.rly` file |
| `screenshotUrls` | ✅ | Array of screenshot URLs (PNG format) |
| `author` | ✅ | Your name or organization |
| `category` | ✅ | App category (e.g., "Utilities", "Games", "Productivity") |
| `license` | ✅ | License type (e.g., "MIT", "Apache-2.0") |

### 4. Open a Pull Request

- Title: `Add [App Name]`
- Description: Brief explanation of what your app does

### 5. Review

We'll review your submission and merge if it meets the guidelines.

## Guidelines

- **Quality**: Apps should be functional and polished
- **Size**: Keep bundles under 5MB when possible
- **Updates**: Submit a new PR to update your app version

## Questions

Open an issue or reach out on Discord.
