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
      url "https://github.com/aurokin/agentscan/releases/download/v0.10.0/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "3170f6ab08d30bd161b4dc99027ea7990d272b86e32047d2b6503ca7760c8fa3"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.10.0/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f25e81d1011df8876426bf79d20a51e8fd8abb01ef4a3ccaba1aeb5118797c6"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.10.0/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "018574ad08d7c302f76416a5a1454933ad3115d83179ab9b0fa98787d29969f2"
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
