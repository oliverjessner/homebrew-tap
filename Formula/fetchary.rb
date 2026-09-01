class Fetchary < Formula
  desc "Watch web pages for changes and archive exact response versions"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-0.1.0.tgz"
  sha256 "3a5283f3570353429d0ed100749a79908a32b7d6140e7cf1e88ccd427c5a0649"
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
