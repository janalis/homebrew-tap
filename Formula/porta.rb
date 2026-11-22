class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.2.2/porta.phar"
  version "0.2.2"
  sha256 "00d37b3ea9e1ef67fafd4510a6579c8875cf3e6bac92cfda337c3aca24c47220"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
