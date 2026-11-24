class Dosker < Formula
  desc "Docker-like system for pre-configured DOS systems"
  homepage "https://github.com/i-zhirov/dosker"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "qemu"

  on_macos do
    on_arm do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.5/dosker-0.1.5-macos-arm64.tar.gz"
      sha256 "8353ccfe9e0c021d5ab152f4083c79554af4c681712cf951d3bbfc5d1c4db7c8"
    end

    on_intel do
      odie "DOSker 0.1.5 does not provide a macOS x86_64 artifact."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.5/dosker-0.1.5-linux-x86_64.tar.gz"
      sha256 "67191e708473640518ab78fbc604528db0f8d41492a86814e66630b3005673e6"
    end

    on_arm do
      odie "DOSker 0.1.5 does not provide a Linux arm64 artifact."
    end
  end

  def install
    bin.install "dosker"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dosker --version")
  end
end
