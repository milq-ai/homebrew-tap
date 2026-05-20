class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://milq.ai"
  license :cannot_represent
  version "0.1.1"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.1/sqim_Darwin_arm64.tar.gz"
      sha256 "fcb9e79fe8d282879765db6bfdae1961518b1377ed0d384fcd1742c4216314bd"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.1/sqim_Darwin_x86_64.tar.gz"
      sha256 "b0b1974e7993c6302ef59fab39a7562ed914938a7e440bdc18e5c54a94d4769b"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim builds Xcode projects", shell_output("#{bin}/sqim help")
  end
end
