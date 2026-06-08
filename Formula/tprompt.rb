class Tprompt < Formula
  desc "Deliver markdown prompts into tmux panes from the terminal"
  homepage "https://github.com/aurokin/tprompt"
  version "0.5.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.0/tprompt-darwin-arm64.tar.gz"
      sha256 "ccd54f32627dbf732d6962e14ed308ee4aca375c624f7326ad24334ac362748e"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.0/tprompt-darwin-amd64.tar.gz"
      sha256 "94f5c2253fe7cf5e2570ff461af5d84478d7a454d999a6a4a07040a3e5e166f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.0/tprompt-linux-arm64.tar.gz"
      sha256 "bb34f05ecee5046ff1f6f64aab3621063a645f5213b2c973559e58abfe90ee91"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.5.0/tprompt-linux-amd64.tar.gz"
      sha256 "9f3c818ba7de9a6407a68389408da73303001c83641704ab4ce1838be299a284"
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
