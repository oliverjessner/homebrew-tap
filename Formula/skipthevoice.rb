class Skipthevoice < Formula
  desc "Local UI and CLI for transcribing WhatsApp voice messages"
  homepage "https://github.com/oliverjessner/SkipTheVoice"
  url "https://registry.npmjs.org/skipthevoice/-/skipthevoice-0.1.2.tgz"
  sha256 "6abe34f2d06b0bd516ee6c0ec60c479cee6fe15299fbb53e0529a549f9677155"
  revision 1

  depends_on "ffmpeg"
  depends_on "node"
  depends_on "openai-whisper"

  def install
    system "npm", "install", *std_npm_args

    cd libexec/"lib/node_modules/skipthevoice" do
      system "npm", "rebuild", "better-sqlite3", "--build-from-source", "--ignore-scripts=false"
    end

    whisper_python = formula_opt_libexec("openai-whisper")/"bin/python"
    worker_packages = libexec/"whisper-worker-packages"
    system whisper_python, "-m", "pip", "install",
           "--disable-pip-version-check", "--target", worker_packages,
           "fastapi==0.139.1", "uvicorn==0.51.0", "python-multipart==0.0.32", "pydantic==2.13.4"

    (bin/"skipthevoice").write_env_script libexec/"bin/skipthevoice", {
      "FFMPEG_PATH"                 => formula_opt_bin("ffmpeg")/"ffmpeg",
      "FFPROBE_PATH"                => formula_opt_bin("ffmpeg")/"ffprobe",
      "PYTHONPATH"                  => worker_packages,
      "SKIPTHEVOICE_WHISPER_PYTHON" => whisper_python,
    }
  end

  test do
    assert_match "SkipTheVoice", shell_output("#{bin}/skipthevoice --help")
    assert_path_exists libexec/"lib/node_modules/skipthevoice/dist/web/server.js"
    ENV["SKIPTHEVOICE_PROJECT_ROOT"] = testpath
    assert_match "schemaReady", shell_output("#{bin}/skipthevoice db status")
    ENV["PYTHONPATH"] = libexec/"whisper-worker-packages"
    system formula_opt_libexec("openai-whisper")/"bin/python", "-c",
           "import fastapi, uvicorn, whisper"
  end
end
