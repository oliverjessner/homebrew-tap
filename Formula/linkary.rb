class Linkary < Formula
  desc "Inspect, clean, purge and resolve web links"
  homepage "https://github.com/oliverjessner/linkary"
  url "https://registry.npmjs.org/linkary/-/linkary-0.2.0.tgz"
  sha256 "c344cd5bb64a07be5c33337d5330b93c94d1400736f1cc8a15d0c2f89692a2ad"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args, "--ignore-scripts"
    bin.install_symlink libexec/"bin/linkary"
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/linkary --version")
    assert_equal "http://example.org/\n", shell_output("#{bin}/linkary normalize 'HTTP://EXAMPLE.org:80'")
    url = "https://example.org/?id=7&utm_source=brew"
    output = shell_output("#{bin}/linkary clean '#{url}' --json")
    assert_equal "https://example.org/?id=7", JSON.parse(output)["cleanUrl"]
  end
end
