class Antibody < Formula
  desc "The fastest shell plugin manager"
  homepage "https://github.com/mattmc3/antibody"
  head "https://github.com/mattmc3/antibody.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = ["-s", "-w", "-X main.version=#{version}"]
    system "go", "build", *std_go_args(ldflags: ldflags), "./"
  end

  test do
    assert_match "antibody version", shell_output("#{bin}/antibody --version")
  end
end
