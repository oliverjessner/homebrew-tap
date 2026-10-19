class Cleanary < Formula
  desc "Count and remove duplicate text lines"
  homepage "https://github.com/oliverjessner/cleanary"
  url "https://registry.npmjs.org/cleanary/-/cleanary-0.1.1.tgz"
  sha256 "968741c3d57ddf9fc283915952900f9d95c9088fd097d88c79e179dbafb2a15b"
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
