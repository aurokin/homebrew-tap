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
