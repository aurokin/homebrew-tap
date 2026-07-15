# homebrew-tap

Homebrew formulae for [aurokin](https://github.com/aurokin) tools.

## Install

```sh
brew install aurokin/tap/tprompt
```

That command auto-taps this repo (`aurokin/homebrew-tap`) and installs the latest
[`tprompt`](https://github.com/aurokin/tprompt) release. `tmux` is pulled in
automatically as a dependency.

## Formulae

### agentscan

CLI and daemon for discovering and managing AI agent panes in tmux.

```sh
brew install aurokin/tap/agentscan
brew install --cask aurokin/tap/agentscan-desktop   # macOS desktop hotkey picker
```

| Platform | Status |
|----------|--------|
| macOS Apple Silicon (arm64) | Signed + notarized (CLI and desktop app) |
| macOS Intel (x86_64) | Not shipped — decided posture; `brew install` exits with a message pointing at `mise`/`ubi` or a source build |
| Linux x86_64 / arm64 | Supported (CLI only) |

After upgrading the CLI, restart the daemon so it runs the new binary:
`agentscan daemon restart`.

### tprompt

Deliver markdown prompts into tmux panes from the terminal.

| Platform | Status |
|----------|--------|
| macOS Apple Silicon (arm64) | Signed + notarized |
| macOS Intel (amd64) | Signed + notarized (from tprompt v0.3.0) |
| Linux x86_64 / arm64 | Supported |

Until tprompt v0.3.0 ships a macOS Intel build, `brew install` on an Intel Mac
exits with a message pointing at `mise`/`ubi` or a source build.

## Maintenance

`Formula/tprompt.rb` is updated automatically by the `bump-homebrew` workflow in
the [tprompt repo](https://github.com/aurokin/tprompt), which runs when a release
is published and rewrites the version, release URLs, and `sha256` values from the
release's `SHA256SUMS` asset.

`Formula/agentscan.rb` and `Casks/agentscan-desktop.rb` are updated the same way
by the `bump-homebrew` workflow in the
[agentscan repo](https://github.com/aurokin/agentscan).
