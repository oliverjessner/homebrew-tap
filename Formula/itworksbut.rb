class Itworksbut < Formula
  desc "Static CI scanner for JavaScript vibe-coding project risks"
  homepage "https://github.com/oliverjessner/ItWorksBut"
  url "https://registry.npmjs.org/itworksbut/-/itworksbut-0.5.0.tgz"
  sha256 "af4b30cd61742b7cd42f8bfd5276b0bf20573effd847837b0b007b3c3ae05b19"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/itworksbut"
  end

  test do
    assert_match "ItWorksBut", shell_output("#{bin}/itworksbut --help")
  end
end
