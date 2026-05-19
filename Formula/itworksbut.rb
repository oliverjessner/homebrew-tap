class Itworksbut < Formula
  desc "Static CI scanner for JavaScript vibe-coding project risks"
  homepage "https://github.com/oliverjessner/ItWorksBut"
  url "https://registry.npmjs.org/itworksbut/-/itworksbut-0.6.0.tgz"
  sha256 "0f4035ba2a2a1ee1620fdd88615ac8d9196da0dda21750122cfd3e101bbe8d04"
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
