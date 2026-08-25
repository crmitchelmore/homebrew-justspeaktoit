cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.63.6"
  sha256 arm:   "1e2fabaacba51c1856af909c300c9a3e526d5acea59d1a809dc6e8da70a6a2e6",
         intel: "a836d6fd3bbbc7c24b3be9b52bdf9a1f9add0056622c2fb3f2cefd63fdc26d0e"

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
