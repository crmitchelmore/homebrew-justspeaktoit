cask "justspeaktoit" do
  version "2.61.0"
  sha256 "5a3e0b3d4a143d50281c34dd1e5d4dab98b132254f783018f16533312e167b8b"

  url "https://github.com/crmitchelmore/justspeaktoit/releases/download/mac-v#{version}/JustSpeakToIt-#{version}.dmg"
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
