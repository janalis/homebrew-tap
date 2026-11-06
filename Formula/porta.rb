class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.1.4/porta.phar"
  version "0.1.4"
  sha256 "5dd43e8e817595d780fe8df454c63fef0e362a3e0a099bd5662e81f436932d06"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
