class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://milq.ai"
  license :cannot_represent
  version "0.1.2"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.2/sqim_Darwin_arm64.tar.gz"
      sha256 "b926401a0fd91b0e91d170aa31a9d8922e097e7d59f2023d0d87bfbfc60c6481"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.2/sqim_Darwin_x86_64.tar.gz"
      sha256 "e0688a106e23f6229d080a489ba6e0b8bc2b4c7ad8c663d57a741242d50b40a2"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim builds Xcode projects", shell_output("#{bin}/sqim help")
  end
end
