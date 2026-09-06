cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "3.0.0"
  sha256 arm:   "a9b749ad748dccf483772ffca1073cb1e19c6eca4b59d934b28a110b34cab791",
         intel: "29039abc43d0baaa89af7fdf853d5fedf89d45d4e3d27c3f2ecee83264a0fe7c"

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
