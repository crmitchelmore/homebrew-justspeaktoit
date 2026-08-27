cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.67.0"
  sha256 arm:   "11c5a007c6ed15360d95f9ec0b2a63852507100ad2bb25bc55269df3dd51ebf8",
         intel: "adde8adfb7fb7d753bbf49ad49dbe1ff4039a7a838e3223dadd2ae1e680effcb"

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
