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
      url "https://github.com/aurokin/agentscan/releases/download/v0.12.0/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "681e9ca72b672b10d64f677a8fb46381a9358b1f0f53cf674948aebde13fe64d"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.12.0/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5e1a2d265e757a608791e3a156d25dc5459ecea6d7d1c05647c6a3129b59078"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.12.0/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dee10b1c8d3fa1b58df9776028c8d3b4e2b858b2355d934dbe48a0546653374b"
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
