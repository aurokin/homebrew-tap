class Tprompt < Formula
  desc "Deliver markdown prompts into tmux panes from the terminal"
  homepage "https://github.com/aurokin/tprompt"
  version "0.5.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.1/tprompt-darwin-arm64.tar.gz"
      sha256 "f02c5b265a7cc3bfafd1de541d8bb4e9fdddb7d6edf731041e3a6031a9021c59"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.1/tprompt-darwin-amd64.tar.gz"
      sha256 "c292d2c9c01843b381c936c76be3ba39626868fe5f355d934ac8ec0a39403e5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.1/tprompt-linux-arm64.tar.gz"
      sha256 "617f321d848fb3b5c0854d6c75590c7340172e58ad9a4123ca4b2cfe851c9073"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.1/tprompt-linux-amd64.tar.gz"
      sha256 "f27701374aae0d1c0e269ec333b78ef4a0fdd923103a9240eba755a8a834db83"
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
