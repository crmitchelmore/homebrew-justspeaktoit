cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.70.2"
  sha256 arm:   "b5ba48b5cd41b6272eef5a5b4c43793444531dfc6d00787c28098b49803b9e6a",
         intel: "e851504f8826eb97ad91c5b0d9c569657a4ea8964369d240b2713d06eb783cbc"

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
