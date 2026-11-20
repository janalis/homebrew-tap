class Porta < Formula
  desc "Terminal IDE for PHP projects"
  homepage "https://janalis.github.io/porta/"
  url "https://github.com/janalis/porta/releases/download/v0.2.0/porta.phar"
  version "0.2.0"
  sha256 "6fb63115f93d20b8b6e1e5cde523b3e06fbafc52e3ef43400f9f0889b481449e"
  license "MIT"

  depends_on "php"

  def install
    bin.install "porta.phar" => "porta"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/porta --version")
  end
end
