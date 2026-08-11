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
      url "https://github.com/aurokin/agentscan/releases/download/v0.12.1/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "d7f482e3aae793899b593d3093fb775963e5b932779f544a8d70499ea8b8a5b7"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.12.1/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c99ea4e79bf7efb94971a009f381dca627ac8609591bc42d34f2bd5a0e9f33d2"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.12.1/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87e479680f3a4a361c2b85eb123b2404c42a8b59486f8960084253cd45fad781"
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
