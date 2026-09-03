cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.70.0"
  sha256 arm:   "37c0e1e1b8323435717aceb9dcc2bd3dde43e2564a3b59983f9f31202bbfdc78",
         intel: "3e30cb4d304f2c062f3896b8a1875341892ba0b8a6d8a18f3bd8c2cd4e1d4759"

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
