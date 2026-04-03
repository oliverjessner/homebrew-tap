class SqliteHub < Formula
  desc "SQLite-only local management app backend and SPA shell"
  homepage "https://github.com/oliverjessner/sqlite-hub"
  url "https://github.com/oliverjessner/sqlite-hub/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "bdb36c9fdb520a2c1e59ede13bb836908eb0d4d1aed51a8bcd0f83e5f42df9a5"

  depends_on "node"
  depends_on "python" => :build

  def install
    ENV["npm_config_build_from_source"] = "true"
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    output = shell_output("#{bin}/sqlite-hub --help")
    assert_match "SQLite Hub CLI", output
  end
end
