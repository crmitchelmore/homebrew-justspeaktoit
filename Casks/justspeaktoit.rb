cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.70.1"
  sha256 arm:   "14e2baaaf3426f44d3ca109daad436b6aa9f0f404f265bdd0cb2dd2cff67ba2e",
         intel: "ed964b82e4d4ef306b02d11330a3ee3a5515e5c6c5807b43dae2308d9bc1dc40"

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
