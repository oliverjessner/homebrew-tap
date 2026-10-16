class Fetchary < Formula
  desc "Stateless semantic web extraction for Node.js"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-2.0.0.tgz"
  sha256 "1c079246eaffb3904d202b28e1dac1b884904a6b32c959905cb9e5210e0429c2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/fetchary"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fetchary --version")
  end
end
