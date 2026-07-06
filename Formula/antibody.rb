class Antibody < Formula
  desc "The fastest shell plugin manager"
  homepage "https://github.com/mattmc3/antibody"
  url "https://github.com/mattmc3/antibody/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "7008da0ba5b040abfcd7724882b54174e454f78bbc66cdffe5cea6ccf3e0fb79"
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
