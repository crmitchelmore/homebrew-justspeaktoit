cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.69.2"
  sha256 arm:   "9d76557a8818382739c90d1e10b358f422285aebfe16191106b2473380cc7418",
         intel: "8ed2d9d83e108b7b17412d6045c38adcdbeb73f5cc8fa751258d7432c7408cab"

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
