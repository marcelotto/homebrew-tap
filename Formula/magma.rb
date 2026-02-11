class Magma < Formula
  desc "LLM-powered prompt development environment"
  homepage "https://github.com/marcelotto/magma"
  version "0.3.2"
  license "MIT"

  depends_on "pandoc"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/marcelotto/magma/releases/download/v0.3.2/magma_macos_arm"
      sha256 "59dc22cea30d98b1951e9b80a736bc6b4e2a6df174c837dfa38e2efd7399921e"
    else
      url "https://github.com/marcelotto/magma/releases/download/v0.3.2/magma_macos_intel"
      sha256 "ef1fb2e6a10bad7c8f77c1efd11df9c5e71c80f0ddaad56ace3b820850adfbc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/marcelotto/magma/releases/download/v0.3.2/magma_linux_arm"
      sha256 "60e71f20a4eb03893d818d022561021d40737b68fd247562ff445c97ee86c7eb"
    else
      url "https://github.com/marcelotto/magma/releases/download/v0.3.2/magma_linux_intel"
      sha256 "b293dc939a15b12fc61c0c9e0192ed5659e2e7ce952059d5608671a5c854aac7"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "magma"
  end

  test do
    assert_match "Magma v0.3.2", shell_output("#{bin}/magma version")
  end
end
