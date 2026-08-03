class Histdb < Formula
  desc "Query shell history from SQLite"
  homepage "https://github.com/mattmc3/histdb"
  head "https://github.com/mattmc3/histdb.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOTOOLCHAIN"] = "auto"
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "."
  end

  test do
    assert_match "histdb", shell_output("#{bin}/histdb --version")
  end
end
