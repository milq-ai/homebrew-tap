class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://milq.ai"
  license :cannot_represent
  version "0.2.1"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.1/sqim_Darwin_arm64.tar.gz"
      sha256 "1fb8669a147274044b549bb00c0fae0c91c72c770819397e266acd532eaa5648"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.1/sqim_Darwin_x86_64.tar.gz"
      sha256 "e2913f9f66257287545d3aba990c2a6ace3ee9f0c44b40424b9967c821188e0c"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim uploads iOS simulator", shell_output("#{bin}/sqim help")
  end
end
