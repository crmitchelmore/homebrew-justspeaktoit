cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.71.1"
  sha256 arm:   "237b544268c72f036d254eb1eabb6a00939225dccabffeb9cd900a5ff7de3231",
         intel: "85e8b4f29f76aa67ca17159bda56cd0c7bc2c2d4f28e5fac7c055941059605b4"

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
