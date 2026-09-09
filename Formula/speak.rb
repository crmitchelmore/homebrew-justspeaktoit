class Speak < Formula
  desc "Terminal and agent automation client for Just Speak to It"
  homepage "https://justspeaktoit.com"
  version "3.0.1"
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
      sha256 "20e8177c29e92c49e7a8927c25d86d8bbef1d96eb6b7fc40898827d2eb5558ef"
    end

    on_intel do
      url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/speak-#{version}-x86_64.zip"
      sha256 "7794f44dfd0c4f80f805aed171edf1e1928796fffc7c41a91b9955b0f704a7b2"
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
