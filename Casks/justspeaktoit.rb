cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.63.5"
  sha256 arm:   "b807976ee84082d4b1f5ec14145b8761591841e6dd77d2d4dcbe9879e0d361f5",
         intel: "25928423ed06ae2dd8413f944737acfa080c6bcafde7ae18c65aa2d1ab7eceb2"

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
