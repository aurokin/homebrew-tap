class Tprompt < Formula
  desc "Deliver markdown prompts into tmux panes from the terminal"
  homepage "https://github.com/aurokin/tprompt"
  version "0.7.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.7.0/tprompt-darwin-arm64.tar.gz"
      sha256 "8d37afe531f5f88ba78b57ee665f2e311236cb66e35d91fbbff46db450cac09b"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.7.0/tprompt-darwin-amd64.tar.gz"
      sha256 "e67fa8d4ed229bb8f402e1837da1c7ed94edd4df187a1c7f34f8d20882653a85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.7.0/tprompt-linux-arm64.tar.gz"
      sha256 "911c07f9768c5cd38a70d0d74bd6b28240937c0a283d3859ab8a0ba8ae4fbdab"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.7.0/tprompt-linux-amd64.tar.gz"
      sha256 "e266a3f9a8eb9148657bb03c4594c0d890028de82689fc12a551f322865fd2ba"
    end
  end

  def install
    bin.install "tprompt"
  end

  test do
    # tprompt has no version subcommand and its main path needs tmux +
    # a TTY (absent in the brew test sandbox). `--help` exits 0 and its
    # output contains the product tagline.
    assert_match "tmux panes", shell_output("#{bin}/tprompt --help")
  end
end
