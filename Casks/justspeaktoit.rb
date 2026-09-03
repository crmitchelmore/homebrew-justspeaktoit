cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.71.0"
  sha256 arm:   "8fb4d10a02f59f6ae030dc420f18b4e8501f131c594007f50c734a45e0a34898",
         intel: "92ed85d248c0a719b082ad9743d48eb90bae03c46f732e36b0064d6a1210c04d"

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
