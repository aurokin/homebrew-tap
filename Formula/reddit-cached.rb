class RedditCached < Formula
  desc "Local-first archive of your Reddit saved, upvoted, and posted content"
  homepage "https://github.com/aurokin/reddit_cached"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.1/reddit-cached-darwin-arm64.tar.gz"
      sha256 "9d8b632c5e27b234a439271c916e5e484a9c6a9b6751bb04f23e2e4010c8aa81"
    end
    on_intel do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.1/reddit-cached-darwin-amd64.tar.gz"
      sha256 "21f8f06ec59d943ecc533d8f1ab35b4fe48170d52a3e2df57d9e6998ccb2aa1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.1/reddit-cached-linux-arm64.tar.gz"
      sha256 "7af560b9a5b36a215469f53c00c5d56c29dd3881c17c7ab3407f30ca051aa060"
    end
    on_intel do
      url "https://github.com/aurokin/reddit_cached/releases/download/v0.1.1/reddit-cached-linux-amd64.tar.gz"
      sha256 "60763f65bf78f3ccbb0251d2a010e00e303e64d207447a4e5a61ab7f8e7cfdb5"
    end
  end

  def install
    bin.install "reddit-cached"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reddit-cached --version")
  end
end
