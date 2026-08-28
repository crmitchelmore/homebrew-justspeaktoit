cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.68.0"
  sha256 arm:   "25effd417bcb0876a4d2589d3d01e74c6d95360ed4f4c8d19202635c7be96171",
         intel: "77c83baf839e2129b43fc64c944b7255a7e8fddcbe5e9d6cfb340483cf1400ef"

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
