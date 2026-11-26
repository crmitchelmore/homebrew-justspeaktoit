cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "3.3.0"
  sha256 arm:   "353e957a4db3252d1efb2c9adb4a3c88502bb43d76c8a0fe4afc18ff165ca05d",
         intel: "62b1974ac0002ee380565d961edb9bd74a07536530c6720edd3b02a22d357c27"

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
