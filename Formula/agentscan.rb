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
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.0/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "906e0af770e6a67ceff1a773768937bcf2e2b37f15c441127b1db7b21554d2d5"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.0/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db19912c49bc68e2bcf13ac8c19e2481c7fb94dc247b05017ef44898cf75fc88"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.0/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7257b08434937c6f333d3ef237b76cbd121b52d538c6e6413a5bff488a865e74"
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
