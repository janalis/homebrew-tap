# Homebrew formula template, rendered by the release workflow into
# janalis/homebrew-tap (Formula/redirect-proxy.rb).
class RedirectProxy < Formula
  desc "High performance HTTP redirect server with an administration backend"
  homepage "https://github.com/janalis/redirect-proxy"
  url "https://github.com/janalis/redirect-proxy/releases/download/v0.1.1/redirect-proxy-0.1.1-erlang.tar.gz"
  sha256 "2f5b82859ffd70a571d5b7648c9347c5f32fe3a6890e11b8ebd3f398b65a2004"
  license "MIT"

  depends_on "erlang"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/redirect-proxy"
    (etc/"redirect-proxy").install libexec/"share/redirect-proxy/config.example.toml" => "config.toml"
  end

  service do
    run [opt_bin/"redirect-proxy", "serve"]
    environment_variables RP_CONFIG:           etc/"redirect-proxy/config.toml",
                          RP_STORAGE_DATA_DIR: var/"lib/redirect-proxy"
    keep_alive true
    log_path var/"log/redirect-proxy.log"
    error_log_path var/"log/redirect-proxy.log"
  end

  def caveats
    <<~EOS
      Create the first administrator:
        RP_CONFIG=#{etc}/redirect-proxy/config.toml \\
        RP_STORAGE_DATA_DIR=#{var}/lib/redirect-proxy \\
        redirect-proxy user add admin
      Then start the service:
        brew services start redirect-proxy
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/redirect-proxy version")
  end
end
