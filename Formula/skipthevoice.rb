class Skipthevoice < Formula
  desc "Read WhatsApp voice messages as text with local Whisper"
  homepage "https://github.com/oliverjessner/SkipTheVoice"
  url "https://registry.npmjs.org/skipthevoice/-/skipthevoice-0.1.0.tgz"
  sha256 "f897f6723df5faff81fae07bec9af5b91c1086587b5e1f8cceb7ded75e92a009"

  depends_on "ffmpeg"
  depends_on "node"
  depends_on "openai-whisper"

  def install
    ENV["npm_config_omit"] = "optional"
    system "npm", "install", *std_npm_args

    whisper_python = formula_opt_libexec("openai-whisper")/"bin/python"
    worker_packages = libexec/"whisper-worker-packages"
    system whisper_python, "-m", "pip", "install",
           "--disable-pip-version-check", "--target", worker_packages,
           "fastapi==0.139.1", "uvicorn==0.51.0", "python-multipart==0.0.32", "pydantic==2.13.4"

    bin.write_env_script libexec/"bin/skipthevoice", {
      "FFMPEG_PATH"                 => formula_opt_bin("ffmpeg")/"ffmpeg",
      "FFPROBE_PATH"                => formula_opt_bin("ffmpeg")/"ffprobe",
      "PYTHONPATH"                  => worker_packages,
      "SKIPTHEVOICE_WHISPER_PYTHON" => whisper_python,
    }
  end

  test do
    assert_match "SkipTheVoice", shell_output("#{bin}/skipthevoice --help")
    ENV["PYTHONPATH"] = libexec/"whisper-worker-packages"
    system formula_opt_libexec("openai-whisper")/"bin/python", "-c",
           "import fastapi, uvicorn, whisper"
  end
end
