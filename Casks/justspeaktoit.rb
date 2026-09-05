cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.71.2"
  sha256 arm:   "d2478bcd78033fe9584aaca507176523ad23ba25d73c067531646f18e0dc83ab",
         intel: "fee32bdb8d7a8f4013ff8681f5f17fd9fa3ac1811ac54fd96eda7489f4ab42e4"

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
