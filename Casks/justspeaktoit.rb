cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.63.0"
  sha256 arm:   "e1cd68dd63b19cf24c3593b11b22e94ba1fb1ff4ebd969a2b590de74af6524b6",
         intel: "93c92285e32463576b3a723e429d9c2cc740cb8a332b8fec8747b5a7b7339062"

  url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/JustSpeakToIt-#{arch}.dmg"
  name "Just Speak to It"
  desc "Voice transcription with on-device or cloud processing"
  homepage "https://justspeaktoit.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "JustSpeakToIt.app"

  zap trash: [
    "~/Library/Application Support/SpeakApp",
    "~/Library/Caches/com.justspeaktoit.mac",
    "~/Library/Preferences/com.justspeaktoit.mac.plist",
  ]
end
