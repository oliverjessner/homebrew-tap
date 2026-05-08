class SqliteHub < Formula
  desc "SQLite-only local management app backend and SPA shell"
  homepage "https://github.com/oliverjessner/sqlite-hub"
  url "https://github.com/oliverjessner/sqlite-hub/archive/refs/tags/v0.9.3.tar.gz"
  sha256 "e8b2aea6d94c53885062aaa21a188e4888af653d09fe0f2d8c76907b863d5b76"
  revision 1

  depends_on "python" => :build
  depends_on "node@24"

  def install
    ENV.prepend_path "PATH", Formula["node@24"].opt_bin
    ENV["npm_config_build_from_source"] = "true"
    system "npm", "install", *std_npm_args
    cd libexec/"lib/node_modules/sqlite-hub" do
      system "npm", "rebuild", "better-sqlite3"
    end
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    node = Formula["node@24"].opt_bin/"node"
    output = shell_output(
      "cd #{libexec}/lib/node_modules/sqlite-hub && #{node} -e " \
      "'const Database = require(\"better-sqlite3\"); const db = new Database(\":memory:\"); " \
      "console.log(db.prepare(\"select 1 as value\").get().value); db.close();'",
    )
    assert_equal "1\n", output
  end
end
