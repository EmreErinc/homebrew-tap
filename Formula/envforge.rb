class Envforge < Formula
  desc "AI-safe environment manager and secret provider CLI"
  homepage "https://envforge.tech"
  url "https://github.com/emreerinc/envforge/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "a61de7d72ac5d55ee6fcf62833e85a4a9d6834d3bf9636360ed42580f72b08b7"
  license "Elastic-2.0"
  head "https://github.com/emreerinc/envforge.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # Generate and install shell completions
    generate_completions_from_executable(bin/"envforge", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match "envforge", shell_output("#{bin}/envforge --version")
  end
end
