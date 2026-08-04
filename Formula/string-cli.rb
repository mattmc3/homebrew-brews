class StringCli < Formula
  desc "Fish shell's string utility for any shell"
  homepage "https://github.com/mattmc3/string"
  version "0.0.4"
  license "MIT"

  on_arm do
    url "https://github.com/mattmc3/string/releases/download/v#{version}/string-#{version}-osx-arm64.tar.gz"
    sha256 "ec4fd527838d360971af14eeb49d033bcd788faadb558e121222735d8aa7c38d"
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
