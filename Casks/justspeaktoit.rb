cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.72.1"
  sha256 arm:   "2b207b6e4f8496b365b722fe30f4ab7635c6937ff1736809a31e3e5d5aec315d",
         intel: "b132254c4604c127ee1ba57f6d1c359f9ccff1dba8a10a509fefdf834e84933c"

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
