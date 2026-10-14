class Fetchary < Formula
  desc "Archive exact web responses and rendered DOM changes"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-1.3.0.tgz"
  sha256 "7f9241408592b58dde7ef1e30065f4511d27a17fcd30323f4e9e379f09d5be5c"
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
