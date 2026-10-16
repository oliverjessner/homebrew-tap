cask "bulkpixel" do
  version "3.1.5"
  sha256 "8c0674fba2714d82113109eadec150df4ace3aa0fde94584a1ec29bb3e8e2301"

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
