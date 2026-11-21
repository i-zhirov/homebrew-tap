class Dosker < Formula
  desc "Docker-like system for pre-configured DOS systems"
  homepage "https://github.com/i-zhirov/dosker"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "qemu"

  on_macos do
    on_arm do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.0/dosker-0.1.0-macos-arm64.tar.gz"
      sha256 "9482a1723c0dfe7a36c7c1c9b56de740dc4bd80b07634d03e2a1705b77a737a3"
    end

    on_intel do
      odie "DOSker 0.1.0 does not provide a macOS x86_64 artifact."
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/i-zhirov/dosker/releases/download/v0.1.0/dosker-0.1.0-linux-x86_64.tar.gz"
      sha256 "0be4a5aa5f0f9f40d92dc39e66dd39b2e096dd6ca14c030d023ace0ac8e31b09"
    end

    on_arm do
      odie "DOSker 0.1.0 does not provide a Linux arm64 artifact."
    end
  end

  def install
    bin.install "dosker"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dosker --version")
  end
end
