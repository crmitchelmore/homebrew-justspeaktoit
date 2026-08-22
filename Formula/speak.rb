class Speak < Formula
  desc "Terminal and agent automation client for Just Speak to It"
  homepage "https://justspeaktoit.com"
  version "2.63.3"
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
      sha256 "8d06a52f24045b80185e131ccc7bff3937658d10c7a32101359315e2e9cfa6b4"
    end

    on_intel do
      url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/speak-#{version}-x86_64.zip"
      sha256 "f4958c110d25052bb9f2c9387b68a587a25b78dacd3a4093db9bd132bf1d7eeb"
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
