class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.1.1/porta.phar"
  version "0.1.1"
  sha256 "8822a8fbd934d376b4eb166ae46645d9b47f09da04abfd34275443ad941984fb"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
