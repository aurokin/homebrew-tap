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
      url "https://github.com/aurokin/agentscan/releases/download/v0.9.0/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "dc239c85e40844c8c11fcfa41c67f05fcccffa70eb5f8748de8c9ef65c772af7"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.9.0/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5db57a749902e73d729b7ea6a5ad7d7d4fb12dee9304f8d1f731f382c4bbe0eb"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.9.0/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f7b48fda60565c0a69a3a09f1b84774c769635e4c8dac7068e56e8136b0142b"
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
