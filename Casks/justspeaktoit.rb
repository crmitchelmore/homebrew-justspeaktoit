cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.63.2"
  sha256 arm:   "bcffb0d52279ca2e65e073ba92e54fe54e65c871bac5cc80159e515dc996c437",
         intel: "da0167a18fe555ddd3d1b49883cfec8eef3501e2d341e14193a8a2231decc32f"

  url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/JustSpeakToIt-#{arch}.dmg"
  name "Just Speak to It"
  desc "Voice transcription with on-device or cloud processing"
  homepage "https://justspeaktoit.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on formula: "crmitchelmore/justspeaktoit/speak"

  app "JustSpeakToIt.app"

  zap trash: [
    "~/Library/Application Support/SpeakApp",
    "~/Library/Caches/com.justspeaktoit.mac",
    "~/Library/Preferences/com.justspeaktoit.mac.plist",
  ]
end
