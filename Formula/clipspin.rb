class Clipspin < Formula
  desc "macOS clipboard cycler for JSON text snippets"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://github.com/oliverjessner/clipspin/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "0d0cb35944044319492b591ff78bb3a7328731a59fca2a479e901df38567f27c"
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
