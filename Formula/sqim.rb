class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://milq.ai"
  license "Proprietary"
  version "0.1.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.0/sqim_Darwin_arm64.tar.gz"
      sha256 "b9496c09c94d618358ebf50c2c1125c93c11fb31c1ba0d0838fef83d151ffb8e"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.0/sqim_Darwin_x86_64.tar.gz"
      sha256 "2661a50894b73ea80d6955b214e1ab4e4e77b6eb935d34e6e828ec4ef0fedd50"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim builds Xcode projects", shell_output("#{bin}/sqim help")
  end
end
