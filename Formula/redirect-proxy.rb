# Homebrew formula template, rendered by the release workflow into
# janalis/homebrew-tap (Formula/redirect-proxy.rb).
class RedirectProxy < Formula
  desc "High performance HTTP redirect server with an administration backend"
  homepage "https://github.com/janalis/redirect-proxy"
  url "https://github.com/janalis/redirect-proxy/releases/download/v0.6.0/redirect-proxy-0.6.0-erlang.tar.gz"
  sha256 "99ef8b1339fd184e2d1a883b9899292ba0565e6938e4d4712906a549c05bfa2e"
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
