cask "pinefetch" do
  version "3.0.0"
  sha256 "3e835705714a92ec9e147ae936969225595a08a0d60626d4a66b231bbc5e888a"

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
