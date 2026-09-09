class SqliteHub < Formula
  desc "SQLite-only local management app backend and SPA shell"
  homepage "https://github.com/oliverjessner/sqlite-hub"
  url "https://github.com/oliverjessner/sqlite-hub/archive/refs/tags/v2.6.3.tar.gz"
  sha256 "a386de21c67784e1f2cb736516d67c3770a64892c1884ac97805f5cd72c69588"

  depends_on "node"
  depends_on "python" => :build

  def install
    ENV["npm_config_build_from_source"] = "true"
    system "npm", "install", *std_npm_args
    cd libexec/"lib/node_modules/sqlite-hub" do
      system "npm", "rebuild", "better-sqlite3"
    end
    # better-sqlite3 ships prebuilds for multiple platforms and architectures.
    platform = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "x64"
    prebuilds = libexec/"lib/node_modules/sqlite-hub/node_modules/better-sqlite3/prebuilds"
    prebuilds.glob("*.node").each do |binary|
      binary.unlink unless binary.basename.to_s == "#{platform}-#{arch}.node"
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
