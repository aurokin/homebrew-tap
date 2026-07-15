class RedditCached < Formula
  desc "Local-first archive of your Reddit saved, upvoted, and posted content"
  homepage "https://github.com/aurokin/reddit_cached"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.0/reddit-cached-darwin-arm64.tar.gz"
      sha256 "3e5c85c8a98af86dee43d9a49b8ba0e2c3d551abeee6d7157c7631f6f8564405"
    end
    on_intel do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.0/reddit-cached-darwin-amd64.tar.gz"
      sha256 "1cb35433ea2fd5d6a34e0091d0c2bbbbab53dc8b203fc8ba72864a58cada493d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.0/reddit-cached-linux-arm64.tar.gz"
      sha256 "ddd86c5b54fcc5997c2aa00b4eecf69ccbf85ac6bacfe2474f979705c8b901f6"
    end
    on_intel do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.0/reddit-cached-linux-amd64.tar.gz"
      sha256 "861f15b9d71f8a221936737c0d1bc7953ff144898b6c93b8eaa3f077db2e6379"
    end
  end

  def install
    bin.install "reddit-cached"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reddit-cached --version")
  end
end
