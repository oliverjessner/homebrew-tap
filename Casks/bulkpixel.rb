cask "bulkpixel" do
  version "3.1.4"
  sha256 "4fb9dcc98a5d95b2d7e6da47a7ec5f71bdb03d99e3092be6c33a8116e945a09e"

  url "https://github.com/oliverjessner/BulkPixel/releases/download/v#{version}/BulkPixel_#{version}_aarch64_adhoc.dmg"
  name "BulkPixel"
  desc "Local-first batch image converter"
  homepage "https://github.com/oliverjessner/BulkPixel"

  depends_on arch: :arm64
  depends_on :macos

  app "BulkPixel.app"
  binary "#{appdir}/BulkPixel.app/Contents/MacOS/bulkpixel", target: "bulkpixel"

  zap trash: [
    "~/Library/Application Support/com.oli.bulkpixel",
    "~/Library/Preferences/com.oli.bulkpixel.plist",
  ]
end
