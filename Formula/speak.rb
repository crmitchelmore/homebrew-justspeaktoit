class Speak < Formula
  desc "Terminal and agent automation client for Just Speak to It"
  homepage "https://justspeaktoit.com"
  version "2.68.1"
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
      sha256 "38e13db39e89858c06be3a2933dfbb2db01d51147674613e6106bdb0c3cdf183"
    end

    on_intel do
      url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/speak-#{version}-x86_64.zip"
      sha256 "6cc3fcf20317f4e01511fb8c5ae51642f9832c64ee09bb6250bf3f32999daa18"
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
