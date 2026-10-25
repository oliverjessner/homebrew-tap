cask "no-bullshit-rss" do
  version "1.6.0"
  sha256 "77609705ef02a5e8661b42b72b814f2c11b47ace8b5a9d3e263addda5b0b4a8d"

  url "https://github.com/oliverjessner/NO-BULLSHIT-RSS/releases/download/v#{version}/NO.BULLSHIT.RSS-#{version}-arm64.dmg"
  name "NO BULLSHIT RSS"
  desc "Local-first RSS reader with clustered digests"
  homepage "https://github.com/oliverjessner/NO-BULLSHIT-RSS"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "NO BULLSHIT RSS.app"
  binary "#{appdir}/NO BULLSHIT RSS.app/Contents/Resources/bin/no-bullshit-rss",
         target: "no-bullshit-rss"

  uninstall quit: "com.oliverjessner.no-bullshit-rss"

  zap trash: [
    "~/Library/Application Support/NO-BULLSHIT-RSS",
    "~/Library/Preferences/com.oliverjessner.no-bullshit-rss.plist",
  ]
end
