class Clipspin < Formula
  desc "Temporary second paste queue for macOS"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://github.com/oliverjessner/clipspin/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "269420af44d3f8999dd1bf6327fb3d8090216e829f8dd1f54b4a913070fdedc3"
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
