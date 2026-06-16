class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://sqim.dev"
  license :cannot_represent
  version "0.2.2"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.2/sqim_Darwin_arm64.tar.gz"
      sha256 "31dae5b5dc37bbfeccaa9a694c54dbad81016a1d946eb24f3b09e5a44905311d"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.2/sqim_Darwin_x86_64.tar.gz"
      sha256 "96694b3a5bca04f65ec2a540489cca1c7ea362ec08fb927bca8ee26563c7dc84"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim uploads iOS simulator", shell_output("#{bin}/sqim help")
  end
end
