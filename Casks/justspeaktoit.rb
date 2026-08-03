cask "justspeaktoit" do
  version "2.36.3"
  sha256 "fe6207c46bdefa450098b95e4fabea0284a4bd37f3b83d96c1a8535f57dd43d9"

  url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/JustSpeakToIt-#{version}.dmg"
  name "Just Speak to It"
  desc "Native macOS voice transcription with on-device or cloud processing"
  homepage "https://justspeaktoit.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "JustSpeakToIt.app"

  zap trash: [
    "~/Library/Application Support/JustSpeakToIt",
    "~/Library/Caches/com.justspeaktoit.app",
    "~/Library/Preferences/com.justspeaktoit.app.plist",
  ]
end
