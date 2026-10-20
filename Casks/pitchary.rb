cask "pitchary" do
  version "0.6.1"
  sha256 "132144326cade3c57a4a500068a260c35e0f5c4bd78284acc45083a9fc5c5ad4"

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
