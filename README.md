# Homebrew Tap: oliverjessner/tap

```sh
brew tap oliverjessner/tap
```

## Installable Packages

| Name | Type | Description | Installation |
| --- | --- | --- | --- |
| `clipspin` | Formula | Temporary second paste queue for macOS | `brew install oliverjessner/tap/clipspin` |
| `itworksbut` | Formula | Static CI scanner for JavaScript vibe-coding project risks | `brew install oliverjessner/tap/itworksbut` |
| `skipthevoice` | Formula | Read WhatsApp voice messages as text with local Whisper | `brew install oliverjessner/tap/skipthevoice` |
| `sqlite-hub` | Formula | SQLite-only local management app backend and SPA shell | `brew install oliverjessner/tap/sqlite-hub` |
| `bulkpixel` | Cask | Local-first batch image converter | `brew install --cask oliverjessner/tap/bulkpixel` |
| `pinefetch` | Cask | Local-first yt-dlp desktop client | `brew install --cask oliverjessner/tap/pinefetch` |

After tapping the repository, packages can also be installed with short names:

```sh
brew install clipspin
brew install itworksbut
brew install skipthevoice
brew install sqlite-hub
brew install --cask bulkpixel
brew install --cask pinefetch
```

## BulkPixel Cask

BulkPixel is installed as a macOS cask:

```sh
brew tap oliverjessner/tap
brew install --cask oliverjessner/tap/bulkpixel
```

The app is currently not signed with an Apple Developer ID or notarized.
macOS may block the first launch.

To open it the first time:

1. Open Finder and go to `/Applications`.
2. Right-click or Control-click `BulkPixel.app`.
3. Select `Open` and confirm the dialog.

If macOS still blocks the app, go to `System Settings` >
`Privacy & Security` and select `Open Anyway` for BulkPixel.

## PineFetch Cask

PineFetch is installed as a macOS cask:

```sh
brew tap oliverjessner/tap
brew install --cask oliverjessner/tap/pinefetch
```

The app is currently not signed with an Apple Developer ID or notarized. If macOS blocks the first launch, right-click `PineFetch.app` in `/Applications`, select `Open`, and confirm the dialog.
