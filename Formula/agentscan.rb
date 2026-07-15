class Agentscan < Formula
  desc "CLI and daemon for discovering and managing AI agent panes in tmux"
  homepage "https://github.com/aurokin/agentscan"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.8.2/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "335d4bb47541a90f87e0b3685e04f01b5b088a7d15b37b075bdccff6551f05e9"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.8.2/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a52543526064524a7987887844a7dd61a47be966e903cbcf2a1bfe74fd6aa33b"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.8.2/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd424c59860fb34db0ab0f42a914a257085964aa4d728f6298ff3db2bcd666a6"
    end
  end

  def install
    bin.install "agentscan"
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
