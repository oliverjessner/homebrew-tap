class Clipspin < Formula
  desc "Temporary second paste queue for macOS"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://github.com/oliverjessner/clipspin/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "630d49820c45f55dd147aa6e992d8b196750970b50ef752d7eea31c336e95ae3"
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
