cask "pitchary" do
  version "0.7.4"
  sha256 "4952ae63e82eaeda0d289033481a9147fd06090d2304d1029b4cc9f65249e47b"

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
