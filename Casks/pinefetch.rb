cask "pinefetch" do
  version "2.6.2"
  sha256 "fbce26db107bf070cab708f30442174c11ff4d5e63491d4a5f820747b4333303"

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
