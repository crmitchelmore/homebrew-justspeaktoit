cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.69.1"
  sha256 arm:   "5a9695007eb1009b9d68397b4e6bab5d79f6721ddfe2e3656bb36ec9d9241bba",
         intel: "afdc948fc9f6ac880badeac8c9e923b1f09573a663396d0e992a12f2bcfbc2d9"

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
