class Clipspin < Formula
  desc "Temporary second paste queue for macOS"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://github.com/oliverjessner/clipspin/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "6c92748944a4029d1c81e17c91207bacfaf68e748ebb9086e60d5d7ded37a6df"
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
