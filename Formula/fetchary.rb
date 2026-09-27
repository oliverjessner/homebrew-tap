class Fetchary < Formula
  desc "Watch web pages for changes and archive exact response versions"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-0.4.0.tgz"
  sha256 "9c111e721da6924c702edcb9c5746259da046e60369c3a6f0b760e959af95073"
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
