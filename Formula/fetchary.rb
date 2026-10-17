class Fetchary < Formula
  desc "Stateless semantic web extraction for Node.js"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-2.0.2.tgz"
  sha256 "e24f570d04576ab01a80a3b5053ddbd33231269050227925a4194aef5230696d"
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
