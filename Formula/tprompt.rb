class Tprompt < Formula
  desc "Deliver markdown prompts into tmux panes from the terminal"
  homepage "https://github.com/aurokin/tprompt"
  version "0.6.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.6.0/tprompt-darwin-arm64.tar.gz"
      sha256 "89a7a6e795ea9634a594bcb610a8e35b1b7340986b3c3b792d120927ca4cfd0e"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.6.0/tprompt-darwin-amd64.tar.gz"
      sha256 "3e4d94ae1bf5b4ff1aaf7f4b1ce37823af935bb6895145a48b4d0bfa7a36466b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.6.0/tprompt-linux-arm64.tar.gz"
      sha256 "eaca01840fd0156340aecf13c768fae63227cc1c9260e1e2392e194c704a5464"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.6.0/tprompt-linux-amd64.tar.gz"
      sha256 "335513d436c035509e3f1432f2efe7f645a85ef4dfd3dcf65164f85dc7d76e93"
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
