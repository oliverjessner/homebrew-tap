class Clipspin < Formula
  desc "Temporary second paste queue for macOS"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://github.com/oliverjessner/clipspin/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "5a44e966c526ab300b694b22a4657c9ae81bf5973d840aa86a38586bfb220d24"
  license "MIT"

  depends_on xcode: :build

  def install
    if File.exist?("Package.swift")
      system "swift", "build", "--configuration", "release", "--disable-sandbox"
      bin.install ".build/release/clipspin"
    else
      system "swiftc", "main.swift", "-o", "clipspin"
      bin.install "clipspin"
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/clipspin 2>&1", 1)
  end
end
