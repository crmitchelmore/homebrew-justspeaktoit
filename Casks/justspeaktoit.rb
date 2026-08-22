cask "justspeaktoit" do
  arch arm: "arm64", intel: "universal"

  version "2.63.1"
  sha256 arm:   "c4ae059a38c6e5ffbf1d8621ebeceaa496e188691c6d1bf8d3340af00155acfc",
         intel: "03a695eaff4d5d2ce7ee3d77b1d00652494754bdb642c4e707caeb63a5dc3950"

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
