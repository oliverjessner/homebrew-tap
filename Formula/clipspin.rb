class Clipspin < Formula
  desc "Temporary second paste queue for macOS"
  homepage "https://github.com/oliverjessner/clipspin"
  url "https://github.com/oliverjessner/clipspin/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "8f710bae3069cb436cd040d782a9b2e259440e638a84b480d4ad11e1d031da92"
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
