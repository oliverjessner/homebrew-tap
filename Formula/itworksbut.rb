class Itworksbut < Formula
  desc "Static CI scanner for JavaScript vibe-coding project risks"
  homepage "https://github.com/oliverjessner/ItWorksBut"
  url "https://registry.npmjs.org/itworksbut/-/itworksbut-0.7.3.tgz"
  sha256 "6a997d6f958bb6fc4decc11f1c1b909126da9fde56199736d4de0e60c64783a2"
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
