class Speak < Formula
  desc "Terminal and agent automation client for Just Speak to It"
  homepage "https://justspeaktoit.com"
  version "2.70.0"
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
      sha256 "5a2460111e9e378a380d142408489d4981e57b888be84f1d7967fc109e5eb195"
    end

    on_intel do
      url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/speak-#{version}-x86_64.zip"
      sha256 "522850d1647da08a6e5860686388aee869060bc3693a49e3b43d7c6b486dc58c"
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
