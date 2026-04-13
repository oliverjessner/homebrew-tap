class SqliteHub < Formula
  desc "SQLite-only local management app backend and SPA shell"
  homepage "https://github.com/oliverjessner/sqlite-hub"
  url "https://github.com/oliverjessner/sqlite-hub/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "ee29563ab08db97adbf889b76018c88c9b7f19525899da31ccdfd2d33c86bfe9"

  depends_on "node"
  depends_on "python" => :build

  def install
    ENV["npm_config_build_from_source"] = "true"
    system "npm", "install", *std_npm_args
    cd libexec/"lib/node_modules/sqlite-hub" do
      system "npm", "rebuild", "better-sqlite3"
    end
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    output = shell_output(
      "cd #{libexec}/lib/node_modules/sqlite-hub && #{Formula["node"].opt_bin}/node -e "       "'const Database = require(\"better-sqlite3\"); const db = new Database(\":memory:\"); "       "console.log(db.prepare(\"select 1 as value\").get().value); db.close();'"
    )
    assert_equal "1\n", output
  end
end
