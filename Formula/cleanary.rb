class Cleanary < Formula
  desc "Count and remove duplicate text lines"
  homepage "https://github.com/oliverjessner/cleanary"
  url "https://registry.npmjs.org/cleanary/-/cleanary-0.1.3.tgz"
  sha256 "37d36621c9c7bf85996df4bdcda4c3e687bb4c9132b141a3c577bfa63c5a3010"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/cleanary"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cleanary --version")
    (testpath/"input.txt").write("alpha\nalpha\nbeta\n")
    assert_equal "alpha\nbeta\n", shell_output("#{bin}/cleanary clean #{testpath}/input.txt")
  end
end
