cask "pinefetch" do
  version "2.0.0"
  sha256 "7969dc79d10855d440aa9c65a33227f3feb2db073a4a5b58041cf6d2fd03fa76"

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
