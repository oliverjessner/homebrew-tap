class Fetchary < Formula
  desc "Archive exact web responses and rendered DOM changes"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-1.2.0.tgz"
  sha256 "eec5366b4c092e638dc542e65b6879ccce44f145022b695b7451c37e1aec1ae6"
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
