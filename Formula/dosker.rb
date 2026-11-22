class Dosker < Formula
  desc "Docker-like system for pre-configured DOS systems"
  homepage "https://github.com/i-zhirov/dosker"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "qemu"

  on_macos do
    on_arm do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.1/dosker-0.1.1-macos-arm64.tar.gz"
      sha256 "e1d77a94703670d1f5a6caecfdb15595a40f4ce48496bc1ba32299f1c2400ce8"
    end

    on_intel do
      odie "DOSker 0.1.1 does not provide a macOS x86_64 artifact."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.1/dosker-0.1.1-linux-x86_64.tar.gz"
      sha256 "cace79c2aea0b763da4103792f487f3b12427a3ae3e4615e8c06d61868d2ce27"
    end

    on_arm do
      odie "DOSker 0.1.1 does not provide a Linux arm64 artifact."
    end
  end

  def install
    bin.install "dosker"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dosker --version")
  end
end
