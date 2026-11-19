cask "no-bullshit-rss" do
  version "2.1.1"
  sha256 "c8eafe8846a6ccea15ab2d1cc9a69002ea0f97611ea08d4f9661a7e4479d455b"

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
