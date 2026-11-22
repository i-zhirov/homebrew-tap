class Dosker < Formula
  desc "Docker-like system for pre-configured DOS systems"
  homepage "https://github.com/i-zhirov/dosker"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "qemu"

  on_macos do
    on_arm do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.2/dosker-0.1.2-macos-arm64.tar.gz"
      sha256 "92fbc39931ad61cad1e6bc657342603d454baf0663b43f6c887afd00f60b3cec"
    end

    on_intel do
      odie "DOSker 0.1.2 does not provide a macOS x86_64 artifact."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.2/dosker-0.1.2-linux-x86_64.tar.gz"
      sha256 "7277e699f6a0a0c24c8ad76e3dd1caf3d0b67203ce30e81b3e084edab8a0c8a4"
    end

    on_arm do
      odie "DOSker 0.1.2 does not provide a Linux arm64 artifact."
    end
  end

  def install
    bin.install "dosker"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dosker --version")
  end
end
