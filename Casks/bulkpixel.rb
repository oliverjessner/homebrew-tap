cask "bulkpixel" do
  version "2.1.2"
  sha256 "6c5c9232617f509f1557601ab6e15a1a17c7b5710f8982e90cc9c65e5ba01571"

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
