cask "bulkpixel" do
  version "2.0.3"
  sha256 "81295c20c7ba3abc2988b18e97f87b2c760346a45bbd71ddebd8a47ce863520f"

  url "https://github.com/oliverjessner/BulkPixel/releases/download/v#{version}/BulkPixel_#{version}_aarch64_adhoc.dmg",
      verified: "github.com/oliverjessner/BulkPixel/"
  name "BulkPixel"
  desc "Local-first batch image converter"
  homepage "https://github.com/oliverjessner/BulkPixel"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "BulkPixel.app"
  binary "#{appdir}/BulkPixel.app/Contents/MacOS/bulkpixel", target: "bulkpixel"

  zap trash: [
    "~/Library/Application Support/com.oli.bulkpixel",
    "~/Library/Preferences/com.oli.bulkpixel.plist",
  ]
end
