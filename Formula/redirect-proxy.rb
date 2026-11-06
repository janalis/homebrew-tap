# Homebrew formula template, rendered by the release workflow into
# janalis/homebrew-tap (Formula/redirect-proxy.rb).
class RedirectProxy < Formula
  desc "High performance HTTP redirect server with an administration backend"
  homepage "https://github.com/janalis/redirect-proxy"
  url "https://github.com/janalis/redirect-proxy/releases/download/v0.4.0/redirect-proxy-0.4.0-erlang.tar.gz"
  sha256 "61dfe464b7dacd2d83b3a5891d1055da488a47bd91ddd1800891d2b06c6cd0f4"
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
