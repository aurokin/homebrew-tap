cask "agentscan-desktop" do
  version "0.10.0"
  sha256 "836bf8d27cbc3c33b4a974af716f2848aa095573cfe59cbe42ab395f8687207b"

  url "https://github.com/aurokin/agentscan/releases/download/v#{version}/agentscan-desktop-aarch64-apple-darwin.zip"
  name "agentscan"
  desc "Desktop hotkey picker for agentscan tmux agent panes"
  homepage "https://github.com/aurokin/agentscan"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The desktop app has no in-app updater by design (AUR-581); brew is the
  # update channel for cask installs.
  auto_updates false
  depends_on arch: :arm64
  depends_on :macos

  app "agentscan.app"

  zap trash: [
    "~/Library/Application Support/com.aurokin.agentscan",
    "~/Library/Caches/com.aurokin.agentscan",
    "~/Library/Preferences/com.aurokin.agentscan.plist",
    "~/Library/Saved Application State/com.aurokin.agentscan.savedState",
    "~/Library/WebKit/com.aurokin.agentscan",
  ]

  caveats <<~EOS
    The desktop app drives the installed agentscan CLI. Install it too:
      brew install aurokin/tap/agentscan
  EOS
end
