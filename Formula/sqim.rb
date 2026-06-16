class Sqim < Formula
  desc "Milq CLI for building Xcode projects on Milq's remote build service"
  homepage "https://sqim.dev"
  license :cannot_represent
  version "0.2.3"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.3/sqim_Darwin_arm64.tar.gz"
      sha256 "2750f0eef458fc2ca5dc6ee33150e496d4f1bc4b336e511efcb190979e7bc868"
    else
      url "https://github.com/milq-ai/sqim-cli-releases/releases/download/v0.2.3/sqim_Darwin_x86_64.tar.gz"
      sha256 "7cdfc816a4ea5bfed381ab8a86701e307e5fa2757afc3b68dfc0e6e02ff48899"
    end
  end

  def install
    bin.install "sqim"
  end

  test do
    assert_match "sqim uploads iOS simulator", shell_output("#{bin}/sqim help")
  end
end
