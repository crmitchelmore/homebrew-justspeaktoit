cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.65.0"
  sha256 arm:   "26491d67e7251c6d3ad014010c1b754687e61f33e255c0a1ca987a13fb393c83",
         intel: "ad15be9eaae0ff5c153180bf0ec0d3d40c34a642f9e22e963a6d1e8842968c33"

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
