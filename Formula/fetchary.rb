class Fetchary < Formula
  desc "Stateless semantic web extraction for Node.js"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-2.0.1.tgz"
  sha256 "89df686ae1cab58c1e36792c6f9adcf828aeaec89dbd98801f5730c0bcde8bb4"
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
