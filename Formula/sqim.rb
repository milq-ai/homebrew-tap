class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://sqim.dev"
  license :cannot_represent
  version "0.2.4"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.4/sqim_Darwin_arm64.tar.gz"
      sha256 "b37d977b45d255877a067eb98c630e67c9373cbf00b1cd7f112da9c7f89b712c"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.4/sqim_Darwin_x86_64.tar.gz"
      sha256 "032ff1286dc4cc52e3a0021369200395bdda335982e6e0d26f5d749b58d01c1f"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim uploads iOS simulator", shell_output("#{bin}/sqim help")
    assert_match "sqim #{version}", shell_output("#{bin}/sqim --version")
  end
end
