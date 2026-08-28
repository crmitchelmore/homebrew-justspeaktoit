cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.68.1"
  sha256 arm:   "5cb2701475a229a3325c42b965386d11a4b5450045e7b0fd76edc02e9d17bef7",
         intel: "9e5145d0edfd6a72a08555adc55b8bbb9c2439733d5a467706b68ac3793b630a"

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
