class Tprompt < Formula
  desc "Deliver markdown prompts into tmux panes from the terminal"
  homepage "https://github.com/aurokin/tprompt"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.3.0/tprompt-darwin-arm64.tar.gz"
      sha256 "864a84246ae981c2438ae4263d47b582e78db0cb57272e917b99e07d0c7df0c9"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.3.0/tprompt-darwin-amd64.tar.gz"
      sha256 "e5895d0f6b3d701858daa1d2b78b38789a84491d75f640364010e653391af516"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.3.0/tprompt-linux-arm64.tar.gz"
      sha256 "0721d204dd24b06d2585dfa9748eec9ff0a2adb83f266792f0bae58d1ab8a47b"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.3.0/tprompt-linux-amd64.tar.gz"
      sha256 "afb1e31dbb3fe6ef07cddb785202befb7a8dd41d5e1d56d089a2494e21b2dd01"
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
