class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "11.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.0.0/webreaper-v11.0.0-osx-arm64.zip"
      sha256 "e736abd029ed415edd235e8e51a086f4123022267474e3875ef2566e35dd06b7"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.0.0/webreaper-v11.0.0-osx-x64.zip"
      sha256 "f51d8d21b2ad5f6a9465dafa872c0749216f24cd0ddb36db60750de3f80f3af9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.0.0/webreaper-v11.0.0-linux-x64.tar.gz"
      sha256 "b56379c13de85b2209b21de1b2e258d8aa9939501ab087b06a22c730219b6f55"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.0.0/webreaper-v11.0.0-linux-arm64.tar.gz"
      sha256 "3bc5c6dbc98aaccfbb4a45534e3eb811392c61e6dd595ad2f6496ed21ae6b145"
    end
  end

  def install
    bin.install "webreaper"
    # The archive ships LICENSE.txt + README.md alongside the binary;
    # `bin.install "webreaper"` ignores them, which is the desired shape.
    # Homebrew's auto-generated caveats include `webreaper help`.
  end

  test do
    # Smoke test: the binary must run and print a version string.
    # ADR-0024: version is tag-derived; matches the formula's `version`.
    assert_match version.to_s, shell_output("#{bin}/webreaper version")
  end
end
