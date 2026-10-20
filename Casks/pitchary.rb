cask "pitchary" do
  version "0.6.2"
  sha256 "f19e60f183fab20f0fc9b48e396323da7b678f38e21dc2758a7b87213dca6c33"

  url "https://github.com/oliverjessner/pitchary/releases/download/v#{version}/Pitchary_#{version}_aarch64.dmg"
  name "Pitchary"
  desc "Local customer, sales and invoice management"
  homepage "https://github.com/oliverjessner/pitchary"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Pitchary.app"

  zap trash: [
    "~/Library/Application Support/com.pitchary.app",
    "~/Library/Caches/com.pitchary.app",
    "~/Library/Preferences/com.pitchary.app.plist",
    "~/Library/WebKit/com.pitchary.app",
  ]
end
