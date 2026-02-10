class Magma < Formula
  desc "LLM-powered prompt development environment"
  homepage "https://github.com/marcelotto/magma"
  version "0.3.1"
  license "MIT"

  depends_on "pandoc"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/marcelotto/magma/releases/download/v0.3.1/magma_macos_arm"
      sha256 "27ae4474ac10722bbef43e1272a06c8dacfb9d63b2254069da97cba3bef20a8e"
    else
      url "https://github.com/marcelotto/magma/releases/download/v0.3.1/magma_macos_intel"
      sha256 "85a8f36e629634ed684bcf4e334a669532a09bc53abf82ae39446fa9dd2ba9f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marcelotto/magma/releases/download/v0.3.1/magma_linux_arm"
      sha256 "efd87ab46c3e2231ee6663395af7db0b3c7179eda1f40e18ded7722cbf8076fb"
    else
      url "https://github.com/marcelotto/magma/releases/download/v0.3.1/magma_linux_intel"
      sha256 "68125d4b0b287d1100d643a7f0529cffafb4535246594e0bcdc43ad985bb5acf"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "magma"
  end

  test do
    assert_match "Magma v0.3.1", shell_output("#{bin}/magma version")
  end
end
