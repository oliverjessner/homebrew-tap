class Fetchary < Formula
  desc "Stateless semantic web extraction for Node.js"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-2.2.0.tgz"
  sha256 "98249bf50c1d1f203f99aefd36d6cc83d4e6a1d8c5e198d47b2c53e8bafeb2e0"
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
