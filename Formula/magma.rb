class Magma < Formula
  desc "LLM-powered prompt development environment"
  homepage "https://github.com/marcelotto/magma"
  version "0.3.0"
  license "MIT"

  depends_on "pandoc"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/marcelotto/magma/releases/download/v0.3.0/magma_macos_arm"
      sha256 "19f229c11d9f1d4e174822dd0eb2c1216367b423a30aca2aeb5ede691990d475"
    else
      url "https://github.com/marcelotto/magma/releases/download/v0.3.0/magma_macos_intel"
      sha256 "712a45dca0555e9d6d86aa615d4a3f71b43d51195bd75d29dc3b46b678dd2aef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marcelotto/magma/releases/download/v0.3.0/magma_linux_arm"
      sha256 "fb2293a0ded8ab791bc4fa86f7fa45e13cc9f53ae6be6cd3fd99b566a7f7a3a1"
    else
      url "https://github.com/marcelotto/magma/releases/download/v0.3.0/magma_linux_intel"
      sha256 "fe047860dd700670d4f7dce48ae1bc35274fc19590589b7f9f23a6bcad7bb92c"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "magma"
  end

  test do
    assert_match "Magma v0.3.0", shell_output("#{bin}/magma version")
  end
end
