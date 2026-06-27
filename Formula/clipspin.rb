class Clipspin < Formula
  desc "macOS clipboard cycler for JSON text snippets"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://github.com/oliverjessner/clipspin/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "0ae3d7ce5098384eca301fb818842b5d4cddca92f9ed2ba682a5063928a69141"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    prebuilds = libexec/"lib/node_modules/clipspin/node_modules/uiohook-napi/prebuilds"
    keep = Hardware::CPU.arm? ? "darwin-arm64" : "darwin-x64"
    prebuilds.children.each { |path| rm_r(path) if path.basename.to_s != keep }
    bin.install_symlink libexec/"bin/clipspin"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/clipspin 2>&1", 1)
  end
end
