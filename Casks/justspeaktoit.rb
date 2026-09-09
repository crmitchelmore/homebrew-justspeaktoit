cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "3.0.1"
  sha256 arm:   "f163ba3f0389093b8d1e503ae33ca235f75ec4efe2fc3a9c5bbea21862e03a46",
         intel: "3ca045790110e48b8e4ed308fa10031291ef6b48e90e451779fc6e0f28dd3a59"

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
