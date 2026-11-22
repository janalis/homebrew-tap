class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.2.1/porta.phar"
  version "0.2.1"
  sha256 "e717566f1f4d2e49c4f8576642af228eb31137bdc664d0dcdb2855138731cc84"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
