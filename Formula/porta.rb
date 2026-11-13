class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.1.8/porta.phar"
  version "0.1.8"
  sha256 "e5b6cdca62bf579218f3176c0749099a15e234d9ba8cd0b71ee4677d43354d05"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
