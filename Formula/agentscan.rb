class Agentscan < Formula
  desc "CLI and daemon for discovering and managing AI agent panes in tmux"
  homepage "https://github.com/aurokin/agentscan"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.3/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "6b721161bda8b6fd245f37649192f97eecea45e6b5c81a7a21b6f8a5a6f69d5d"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.3/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "152913f56b1982c91f438135193aa521897f7c16ed0df7a4fa3e74c2dc323826"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.3/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "887d493e4c39fa8ac7ed14b2e02ba4ba4b0161dc2ac30525a12dc0d45f966874"
    end
  end

  def install
    bin.install "agentscan"
    bash_completion.install "completions/agentscan.bash"
    zsh_completion.install "completions/_agentscan"
    fish_completion.install "completions/agentscan.fish"
  end

  def caveats
    <<~EOS
      After upgrading, restart the background daemon so it runs the new binary:
        agentscan daemon restart
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentscan --version")
  end
end
