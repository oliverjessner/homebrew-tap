cask "pitchary" do
  version "1.0.1"
  sha256 "a80c97ac277c25f60163751eb210377cc580c0e61f380cb57504ab68b4278a09"

  url "https://github.com/oliverjessner/pitchary/releases/download/v#{version}/Pitchary_#{version}_aarch64.dmg"
  name "Pitchary"
  desc "Local customer, sales and invoice management"
  homepage "https://github.com/oliverjessner/pitchary"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Pitchary.app"

  zap trash: [
    "~/Library/Application Support/com.pitchary.app",
    "~/Library/Caches/com.pitchary.app",
    "~/Library/Preferences/com.pitchary.app.plist",
    "~/Library/WebKit/com.pitchary.app",
  ]
end
