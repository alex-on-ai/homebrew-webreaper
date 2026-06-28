class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/alex-on-ai/WebReaper"
  version "11.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alex-on-ai/WebReaper/releases/download/v11.3.2/webreaper-v11.3.2-osx-arm64.zip"
      sha256 "df43a2d0a0cf3d352e8c1bcb17186b292cbbaa6ba8ac00680a595a755a60f088"
    end
    on_intel do
      url "https://github.com/alex-on-ai/WebReaper/releases/download/v11.3.2/webreaper-v11.3.2-osx-x64.zip"
      sha256 "8c656f67da85fdb3e16cffec962ea3b2f596223d3bd12a335a7feb0d24bea1bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alex-on-ai/WebReaper/releases/download/v11.3.2/webreaper-v11.3.2-linux-x64.tar.gz"
      sha256 "a57877b5c315d76e3f3831614e5e682940a0fd47c12f734b5c2dbcb720d9ebb2"
    end
    on_arm do
      url "https://github.com/alex-on-ai/WebReaper/releases/download/v11.3.2/webreaper-v11.3.2-linux-arm64.tar.gz"
      sha256 "351da1dab79b6c2a0e4b29fe33a5d53566496deb8ee0f892cad9362ddd0eb039"
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
