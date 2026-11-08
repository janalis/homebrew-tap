class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.1.5/porta.phar"
  version "0.1.5"
  sha256 "78ce9c78e795a6b4d3c442b949d18297c3c9ef4193204ce179e125669cb6d43d"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
