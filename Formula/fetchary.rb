class Fetchary < Formula
  desc "Archive exact web responses and rendered DOM changes"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-1.0.0.tgz"
  sha256 "a53c34b6e624f5569c2520c0d10d1d73dfe404ff284c919d9f21ea4f3d48ce75"
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
