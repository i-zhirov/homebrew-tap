class Dosker < Formula
  desc "Docker-like system for pre-configured DOS systems"
  homepage "https://github.com/i-zhirov/dosker"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "qemu"

  on_macos do
    on_arm do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.3/dosker-0.1.3-macos-arm64.tar.gz"
      sha256 "d950ef514a31c5804114255bcbb754194fbff69717a3a15f366611dee4524dfa"
    end

    on_intel do
      odie "DOSker 0.1.3 does not provide a macOS x86_64 artifact."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.3/dosker-0.1.3-linux-x86_64.tar.gz"
      sha256 "6763aa04e54499fa93f625b0f1adc6554110a549358c0143f74a9695238bc8be"
    end

    on_arm do
      odie "DOSker 0.1.3 does not provide a Linux arm64 artifact."
    end
  end

  def install
    bin.install "dosker"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dosker --version")
  end
end
