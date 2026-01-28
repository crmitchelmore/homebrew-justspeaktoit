cask "justspeaktoit" do
  version "0.7.5"
  sha256 "e39f4c1bc0f1a0389eef69dc7da09b7343747e7ee85723dc7aaeb4308aa843e6"

  url "https://github.com/crmitchelmore/justspeaktoit/releases/download/v#{version}/JustSpeakToIt-#{version}.dmg"
  name "Just Speak to It"
  desc "Native macOS voice transcription with on-device or cloud processing"
  homepage "https://justspeaktoit.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "JustSpeakToIt.app"

  zap trash: [
    "~/Library/Application Support/JustSpeakToIt",
    "~/Library/Caches/com.justspeaktoit.app",
    "~/Library/Preferences/com.justspeaktoit.app.plist",
  ]
end
