cask "pinefetch" do
  version "2.5.1"
  sha256 "7fdf18f09934172c713ab0ca40805b4fec8094320ee74ff4dd4c33c601ae0077"

  url "https://github.com/oliverjessner/PineFetch/releases/download/v#{version}/PineFetch_#{version}_aarch64_adhoc.dmg",
      verified: "github.com/oliverjessner/PineFetch/"
  name "PineFetch"
  desc "Local-first yt-dlp desktop client"
  homepage "https://github.com/oliverjessner/PineFetch"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "PineFetch.app"
  binary "#{appdir}/PineFetch.app/Contents/MacOS/PineFetch", target: "PineFetch"

  zap trash: [
    "~/Library/Application Support/com.pinefetch.app",
    "~/Library/Preferences/com.pinefetch.app.plist",
  ]
end
