class Itworksbut < Formula
  desc "Static CI scanner for JavaScript vibe-coding project risks"
  homepage "https://github.com/oliverjessner/ItWorksBut"
  url "https://registry.npmjs.org/itworksbut/-/itworksbut-0.7.0.tgz"
  sha256 "0fb7060dca4a8c28d7c41bf79deb98e22346cf49d124600924d1fed5db5ed01a"
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
