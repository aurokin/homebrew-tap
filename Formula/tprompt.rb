class Tprompt < Formula
  desc "Deliver markdown prompts into tmux panes from the terminal"
  homepage "https://github.com/aurokin/tprompt"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.4.0/tprompt-darwin-arm64.tar.gz"
      sha256 "fc9e8bdee7e67a2f65cf77a645a3bfad35945f85fa1aa716e51a502c05fc917c"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.4.0/tprompt-darwin-amd64.tar.gz"
      sha256 "606a86dbc428d3c00846bbfdd0608ecf268c3eb1f55a7baef8382e52e5584d1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.4.0/tprompt-linux-arm64.tar.gz"
      sha256 "1ef078b6075928664a04c84bf3195519606111dcaa885860592b107e39e690b6"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.4.0/tprompt-linux-amd64.tar.gz"
      sha256 "7ee12b0753c17e26af65b4e9718acd526aa9a3a0b07233d09fc4d45c9fc8262b"
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
