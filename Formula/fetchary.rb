class Fetchary < Formula
  desc "Stateless semantic web extraction for Node.js"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-2.1.1.tgz"
  sha256 "30265990fb62332f924e59d3b4e599e72a5e671f8d361b93a927d825f66745e4"
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
