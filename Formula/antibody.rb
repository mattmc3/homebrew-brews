class Antibody < Formula
  desc "The fastest shell plugin manager"
  homepage "https://github.com/mattmc3/antibody"
  url "https://github.com/mattmc3/antibody/archive/refs/tags/v7.1.0.tar.gz"
  sha256 "a377c1b1d93db3fe79294ac5b156f0689021615a8a544b82823748f49905b9ed"
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
