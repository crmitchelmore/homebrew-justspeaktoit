cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.69.0"
  sha256 arm:   "fcf650a71567ea51588fa42d40b319dcedbdef6e2b0140df3cb3e29e6254d1da",
         intel: "2b8498485cc2ab24355d1d8998dc41fc62b73648f93d7a2f16c2a3544b419782"

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
