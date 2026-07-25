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
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.1/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "9bf69ec514ddc13f23c9b4d1ee886e0657ee301f88adfba4708dc942de160924"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.1/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e23492a2605ca2f6cd129fcf5006fd5f0e3ee4e250c77bd0c026bcbfb6ea7d5"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.1/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53bcea425b9b21d13ab60e5996ab1faca13e157acbcf90de8887fc19db551e3f"
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
