class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "11.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.2.0/webreaper-v11.2.0-osx-arm64.zip"
      sha256 "1cecae0be20978c5cc3c65c6e9383e94acdd9d182f38f0143a00a32b16b7122c"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.2.0/webreaper-v11.2.0-osx-x64.zip"
      sha256 "401f5cf34ab859a1f498e666b8fe21ab30fef704ce7035dfcd9453df258f51fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.2.0/webreaper-v11.2.0-linux-x64.tar.gz"
      sha256 "3df4f5d501058edd88d4d7a0d2d8a1e8815b0076ca4a6c995cd74da977e217a2"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.2.0/webreaper-v11.2.0-linux-arm64.tar.gz"
      sha256 "07df0473bbe828288af821d12ed93c5c2e5482c36c101f8cf348d9d7771b7f24"
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
