cask "no-bullshit-rss" do
  version "1.4.0"
  sha256 "2bf89815dd03b49ebc6e962704cd6c6d347c7e734af564f1c3fe356e87ce8b33"

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
