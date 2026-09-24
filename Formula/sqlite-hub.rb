class SqliteHub < Formula
  desc "SQLite-only local management app backend and SPA shell"
  homepage "https://github.com/oliverjessner/sqlite-hub"
  url "https://github.com/oliverjessner/sqlite-hub/archive/refs/tags/v2.7.1.tar.gz"
  sha256 "64f9a988ccffea34215aead6c3252a6572c30ace3b1f680ca966729b8394c93f"

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
