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
      url "https://github.com/aurokin/agentscan/releases/download/v0.8.3/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "2a7701d5aa9b255451722c1b45abc1910c1c13ae5fa291fd5381d2dfdf69bf69"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.8.3/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a85fe12b1ae69ac9a919ee09758a921fe23fba92de85c54c93eda3271eec7556"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.8.3/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1360310d8fe7a6138bc79803f162c1fe8fe5c6ff98d91d1dc37b8d6341751ffe"
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
