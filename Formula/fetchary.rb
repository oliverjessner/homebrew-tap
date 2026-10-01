class Fetchary < Formula
  desc "Archive exact web responses and rendered DOM changes"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-1.1.0.tgz"
  sha256 "f7536c9a6e373e09f2ec92c1833d40c73e87a5bdc061292bbf00e86676b3d530"
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
