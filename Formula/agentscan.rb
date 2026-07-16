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
      url "https://github.com/aurokin/agentscan/releases/download/v0.9.1/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "6706def6fc91ee097f3e78067cbd599c64d4128e34e13940b1169207df0f6e6c"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.9.1/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a77774afa6d1d13c4c7191137052ac01c4b608bb2450e92d7059ec5f3e0374e"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.9.1/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41ca35b4a0b0f1bf0078177bb9a795b6e3cbd833d1048b778e301aca1c29c69c"
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
