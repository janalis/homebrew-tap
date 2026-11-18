# Homebrew formula template, rendered by the release workflow into
# janalis/homebrew-tap (Formula/redirect-proxy.rb).
class RedirectProxy < Formula
  desc "High performance HTTP redirect server with an administration backend"
  homepage "https://github.com/janalis/redirect-proxy"
  url "https://github.com/janalis/redirect-proxy/releases/download/v0.8.0/redirect-proxy-0.8.0-erlang.tar.gz"
  sha256 "9361d2eed233639cdc6b5d685a25d297017eb8b7c04a2a22f53db636e551c194"
  license "MIT"

  depends_on "erlang"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/redirect-proxy"
    (etc/"redirect-proxy").install libexec/"share/redirect-proxy/config.example.toml" => "config.toml"
  end

  def post_install
    (var/"lib/redirect-proxy").mkpath
  end

  service do
    run [opt_bin/"redirect-proxy", "serve"]
    environment_variables RP_CONFIG:           etc/"redirect-proxy/config.toml",
                          RP_STORAGE_DATA_DIR: var/"lib/redirect-proxy"
    # the data directory: an erl_crash.dump lands there, not in /
    working_dir var/"lib/redirect-proxy"
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
