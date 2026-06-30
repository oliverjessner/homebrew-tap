cask "bulkpixel" do
  version "2.0.0"
  sha256 "822e1433a866306e0467668deebf115db4ba4962db23a858fac8336926e73c39"

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
