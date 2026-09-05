cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.72.0"
  sha256 arm:   "ce5cdc2ed6d4edcc7c4f72ba48e07ea35511891ae797434a8757bc89bf8b2135",
         intel: "426e2e36f836fa4f0b059a978a301a0a5b509bb9f2f8b2762f4dac0c44502fbb"

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
