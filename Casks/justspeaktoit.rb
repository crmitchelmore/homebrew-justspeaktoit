cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.62.0"
  sha256 arm: "196255de3df9f94b5d3ca6e66664e769e26a4a9545645a56edc92f4883bc5700", intel: "11be915576a7d122a8fab90a5a705c39f5b525136cd300af608f58682d693ed3"

  url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/JustSpeakToIt-#{arch}.dmg"
  name "Just Speak to It"
  desc "Native macOS voice transcription with on-device or cloud processing"
  homepage "https://justspeaktoit.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "JustSpeakToIt.app"
  binary "#{appdir}/JustSpeakToIt.app/Contents/MacOS/speak"

  zap trash: [
    "~/Library/Application Support/JustSpeakToIt",
    "~/Library/Caches/com.justspeaktoit.app",
    "~/Library/Preferences/com.justspeaktoit.app.plist",
  ]
end
