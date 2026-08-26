cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.66.0"
  sha256 arm:   "7279b1a8d756632b5b219e3fb0abe211d9c41c073a6c16ae84fa047f4a349442",
         intel: "1dcf04a92fa802f19dde7f4d13078cb4cad7b3de2fb02c2ec95d77f08f6df75c"

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
