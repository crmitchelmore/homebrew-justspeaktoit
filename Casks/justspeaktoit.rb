cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.63.4"
  sha256 arm:   "207ae76f48e6b38854eb0bf55949ea23441a1749f4e3f4b4553d6c15e0e5fde5",
         intel: "60ae428625464b773c7adc6f896b0b06e8110050c48356c08c8bcb6ff9b26aa5"

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
