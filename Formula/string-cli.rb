class StringCli < Formula
  desc "Fish shell's string utility for any shell"
  homepage "https://github.com/mattmc3/string"
  version "0.0.3"
  license "MIT"

  on_arm do
    url "https://github.com/mattmc3/string/releases/download/v#{version}/string-#{version}-osx-arm64.tar.gz"
    sha256 "7f81079fda83b3d3494f1396417a55cf4048e94992bebcb853cca43ebc7af70c"
end

  keg_only <<~EOS
    this formula is keg-only, which means it was not symlinked into #{HOMEBREW_PREFIX},
    because fish shell provides a built-in `string` command and installing this in
    parallel can cause all kinds of trouble.

    If you need to have string first in your PATH, run:
      echo 'export PATH="#{HOMEBREW_PREFIX}/opt/string-cli/bin:$PATH"' >> ${ZDOTDIR:-$HOME}/.zshrc
  EOS

  def install
    bin.install "string"
  end

  test do
    assert_match "string #{version}", shell_output("#{bin}/string --version")
  end
end
