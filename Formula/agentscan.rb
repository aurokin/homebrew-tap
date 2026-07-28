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
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.2/agentscan-aarch64-apple-darwin.tar.gz"
      sha256 "2abb5d6c0c85b32cdec21f615c065fe380fa53fc6a625a892147fb482cc26508"
    end
    on_intel do
      odie "agentscan does not ship a macOS Intel (x86_64) binary. " \
           "Install via 'mise use -g ubi:aurokin/agentscan@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.2/agentscan-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e73533f849c121bf9e5af95bab099391ca5680eccc20b0d31f82b7267ee3524"
    end
    on_intel do
      url "https://github.com/aurokin/agentscan/releases/download/v0.11.2/agentscan-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbbf3db9acac3ac1159c4b27ff957a81fbe1eb6920360e196d17bd0cc109f158"
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
