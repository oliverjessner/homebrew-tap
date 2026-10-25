cask "pitchary" do
  version "0.6.4"
  sha256 "f8c7773e3ad25e630d86f8d447190d92f4907dc219490d1389ecd56ec77f53d1"

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
