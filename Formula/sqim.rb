class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://milq.ai"
  license :cannot_represent
  version "0.1.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.0/sqim_Darwin_arm64.tar.gz"
      sha256 "c863272d1a90bc4337566e64033acaf7caaf0c28e1b5deeefdf787b7cb007caf"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.1.0/sqim_Darwin_x86_64.tar.gz"
      sha256 "5d923478199c91e0ae0284cb13e608d70fab7a9a32d5881b9694716686dd1ef4"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim builds Xcode projects", shell_output("#{bin}/sqim help")
  end
end
