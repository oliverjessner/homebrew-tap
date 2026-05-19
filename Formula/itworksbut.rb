class Itworksbut < Formula
  desc "Static CI scanner for JavaScript vibe-coding project risks"
  homepage "https://github.com/oliverjessner/ItWorksBut"
  url "https://registry.npmjs.org/itworksbut/-/itworksbut-0.7.2.tgz"
  sha256 "32655e0648018e1b8541dc8173c0e810678b845ea35fc96f6206baf8b1cd0bc4"
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
