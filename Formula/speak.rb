class Speak < Formula
  desc "Terminal and agent automation client for Just Speak to It"
  homepage "https://justspeaktoit.com"
  version "2.71.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^mac-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: :sonoma

  on_macos do
    on_arm do
      url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/speak-#{version}-arm64.zip"
      sha256 "5c8b4ea09b22d3bc9ce57d35e43a015751786decb536987baec134fcfe03a362"
    end

    on_intel do
      url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/speak-#{version}-x86_64.zip"
      sha256 "d5b39b9d6b62f5857ec10f3fef47a2b09e576564c060eddd5f0e21f5034e93cd"
    end
  end

  def install
    bin.install "speak"
  end

  def caveats
    <<~EOS
      speak talks to the Just Speak to It app over its local automation socket;
      install the app (brew install --cask justspeaktoit) and enable Automation
      in its Settings.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/speak --version")
  end
end
