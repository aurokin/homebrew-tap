class Tprompt < Formula
  desc "Deliver markdown prompts into tmux panes from the terminal"
  homepage "https://github.com/aurokin/tprompt"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "tmux"

  on_macos do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.2.1/tprompt-darwin-arm64.tar.gz"
      sha256 "52154f0f84ce2882cd88eb6d4c36000d2c35aced984a118aaa4bf44d74ed6b41"
    end
    on_intel do
      odie "tprompt does not ship a macOS Intel (amd64) binary. " \
           "Install via 'mise use -g ubi:aurokin/tprompt@latest' or build from source."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/tprompt/releases/download/v0.2.1/tprompt-linux-arm64.tar.gz"
      sha256 "823f3491c7483a1e8ef9a4251eeb8b57de435640c79113c3f8d8fa6dbab9277a"
    end
    on_intel do
      url "https://github.com/aurokin/tprompt/releases/download/v0.2.1/tprompt-linux-amd64.tar.gz"
      sha256 "7a9ad5c318dfc9b3ca440ae8bd2bb08acc37de26f35dcc14280edfd91f6ecc6c"
    end
  end

  def install
    bin.install "tprompt"
  end

  test do
    assert_match "tmux panes", shell_output("#{bin}/tprompt --help")
  end
end
