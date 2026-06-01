class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://milq.ai"
  license :cannot_represent
  version "0.2.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.0/sqim_Darwin_arm64.tar.gz"
      sha256 "e2b0d118d5b1b556f3109f1154fc3ff2b5e29e88fb34c9c3f626732fa79de29f"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.0/sqim_Darwin_x86_64.tar.gz"
      sha256 "3632fee48afbbd667b2ac184b46f8fefe2bd655f5dc514a422fd0ce8ace9bcc6"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim uploads iOS simulator", shell_output("#{bin}/sqim help")
  end
end
