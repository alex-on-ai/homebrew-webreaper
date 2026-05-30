class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "11.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.0/webreaper-v11.1.0-osx-arm64.zip"
      sha256 "da6895edaa22997559d53d9e3c27354291ab059905dcde306c2f95ceedeb3a4e"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.0/webreaper-v11.1.0-osx-x64.zip"
      sha256 "7714ca0de222ef199b4b030c7cc79b707e9cfd78c5e75b154ad0ed2dcd7905f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.0/webreaper-v11.1.0-linux-x64.tar.gz"
      sha256 "8a99d4fe5f0f1bc70d8c74d985fce8c06ca013cb2cad6a2ce8d252911cdfc906"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.1.0/webreaper-v11.1.0-linux-arm64.tar.gz"
      sha256 "104c5035707a9c66f3b40ae9cfe96daca0ace233c206dc7794ac4bb1f82d5255"
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
