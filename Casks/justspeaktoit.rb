cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "3.2.0"
  sha256 arm:   "71a8d7d210c06b4c41565020d6dd757a97ed6a0ad998cfd2fa3448cfe5293409",
         intel: "89e6342af3a0320bb79eda0678505625eeafb758c085f4abb42228bbda269c2b"

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
