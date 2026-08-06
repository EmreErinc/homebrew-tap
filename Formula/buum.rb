class Buum < Formula
  desc "Fast, multi-package manager updater CLI tool for macOS"
  homepage "https://github.com/EmreErinc/buum-cli"
  url "https://github.com/EmreErinc/buum-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "aeaa6ebdb2b4d10a15d18cbad402e86a0a943219d678186f4f92a3ddbd3bd880"
  license "MIT"
  head "https://github.com/EmreErinc/buum-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"buum"), "./cmd/buum"
  end

  test do
    system "#{bin}/buum", "--help"
  end
end
