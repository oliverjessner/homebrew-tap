class Clipspin < Formula
  desc "macOS clipboard cycler for JSON text snippets"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://registry.npmjs.org/clipspin/-/clipspin-0.1.2.tgz"
  sha256 "32468b090a430126e2a29938376bce7b664585b3f377b150bd2fca1d30deb9fa"
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
