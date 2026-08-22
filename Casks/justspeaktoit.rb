cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.63.3"
  sha256 arm:   "ea3f3aca0a51e9c39d2dedc0657e09dd06af03a4ddefef8b82b9649cd9234a11",
         intel: "a7b53be5b35d0f0ed404c3c6b2a5232e25219ae0217a0c2445d8c6df8b45900c"

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
