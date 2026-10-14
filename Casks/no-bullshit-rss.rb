cask "no-bullshit-rss" do
  version "1.3.0"
  sha256 "9f26ae125423b1ff5280f6cf897403ef63dfbc0325df660f788b596d965c504a"

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
