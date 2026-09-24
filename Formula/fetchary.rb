class Fetchary < Formula
  desc "Watch web pages for changes and archive exact response versions"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-0.3.0.tgz"
  sha256 "b6cf595a8f69c926f4ed04685ebb2b43ed5cde4501cdb030e538bb58361e572e"
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
