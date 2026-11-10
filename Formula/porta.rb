class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.1.7/porta.phar"
  version "0.1.7"
  sha256 "708c29f94ff55ab66aca6c2b8bfe16d815bdad6f90436b2d85db263f8a547efa"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
