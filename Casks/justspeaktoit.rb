cask "justspeaktoit" do
  version "2.35.1"
  sha256 "c9abeb8b1d0fd75d37322b3cd126ca43fb8b83c7d705a0d3a1209d8716cddea9"

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
