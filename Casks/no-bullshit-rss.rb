cask "no-bullshit-rss" do
  version "1.3.3"
  sha256 "503157fa907f9438b3b26cc9eb347304b7572d4194335407d80a569dc3df4c87"

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
