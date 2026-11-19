class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.1.9/porta.phar"
  version "0.1.9"
  sha256 "cb8635603fb0853a0028103ec5b2d9c79c3c5c16a1ea5523035c51b8e4dd87c3"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
