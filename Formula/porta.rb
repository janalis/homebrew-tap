class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.1.6/porta.phar"
  version "0.1.6"
  sha256 "a6f3b7d298bdcf9f48a61475a3ba7939fce0338a0eb8547e0e953bb33d0ab073"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
