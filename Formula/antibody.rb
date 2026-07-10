class Antibody < Formula
  desc "The fastest shell plugin manager"
  homepage "https://github.com/mattmc3/antibody"
  url "https://github.com/mattmc3/antibody/archive/refs/tags/v7.0.1.tar.gz"
  sha256 "068b3a6535059313bfa3cd67b2bdf73d1c63e3ea521dfc9f39326b3db00d94f6"
  head "https://github.com/mattmc3/antibody.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = ["-s", "-w", "-X main.version=#{version}"]
    system "go", "build", *std_go_args(ldflags: ldflags), "./"
    generate_completions_from_executable(bin/"antibody", "completions", shells: [:zsh])
  end

  test do
    assert_match "antibody version", shell_output("#{bin}/antibody --version")
  end
end
