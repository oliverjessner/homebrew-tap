class Fetchary < Formula
  desc "Watch web pages for changes and archive exact response versions"
  homepage "https://github.com/oliverjessner/fetchary"
  url "https://registry.npmjs.org/fetchary/-/fetchary-0.1.1.tgz"
  sha256 "883bff3d825be46410178d1380a98471b43514ece0d242a656d9528ca7f1fd50"
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
