cask "justspeaktoit" do
  version "2.39.0"
  sha256 "ea3db0294b512d342bca5437ff62bb3818fc96e5236fe30089358116d6734838"

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
