cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.64.0"
  sha256 arm:   "017f0f4ca9b40d992217c7ee06cb05822817ae368f2f77c96db8c53633ab5a79",
         intel: "7b38924844d18ad6d6779e3095616e7832633659bc839b68ef85238a9f4f56a7"

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
