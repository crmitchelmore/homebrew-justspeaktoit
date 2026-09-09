cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "3.1.0"
  sha256 arm:   "3549ef2e2c6065fa8ce9f0563dd76c284799b7124501d4ba35ad953c49d73223",
         intel: "7ec531b955eb3a0bd3f0f94a398bd5c46fe7cbe508f4298cd24bf9e0f63f6846"

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
