class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "11.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.2/webreaper-v11.1.2-osx-arm64.zip"
      sha256 "2116101c0a71fc4f6cc8344dcdb02e4f95669adab3a6db6c270bec7bc40c0b2a"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.2/webreaper-v11.1.2-osx-x64.zip"
      sha256 "4eae8fa27e9ee5147db23e319b63a94338e4431f917975bc34163447c806f65b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.2/webreaper-v11.1.2-linux-x64.tar.gz"
      sha256 "59e0d75ccfc5ddb71dcb0e126839dc747b01860cce7977659f462b4364abb76a"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.2/webreaper-v11.1.2-linux-arm64.tar.gz"
      sha256 "f4a17de500155b6f2f968b6916e3158d0574485fc3c2bdc9e9694e1a7d212457"
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
