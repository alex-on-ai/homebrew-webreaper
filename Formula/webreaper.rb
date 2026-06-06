class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "11.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-osx-arm64.zip"
      sha256 "6e3ef476122a362d2511fe4b4e0036f86849e09a4eed44eface6ec7838080b80"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-osx-x64.zip"
      sha256 "26019caeb08c892d4c3ce5f684787dc8e97d640c5ab262fd9bf82e76b9f27d77"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-linux-x64.tar.gz"
      sha256 "3cfbb0e3dc19fc07892d52c3e478f17b25cfae863a305778d9b378b27795e934"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-linux-arm64.tar.gz"
      sha256 "c79cbd8fb727630f1f15a5982823e67402f0cb7b146e452afc65caad90d81a76"
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
