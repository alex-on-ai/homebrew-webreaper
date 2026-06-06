class Webreaper < Formula
  desc "Declarative .NET web scraper / crawler: AI-native CLI"
  homepage "https://github.com/pavlovtech/WebReaper"
  version "11.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-osx-arm64.zip"
      sha256 "b6b1a3fed7079265ae10f2373aec67fe88e10cfbff3dc93af4312beb5c94af74"
    end
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-osx-x64.zip"
      sha256 "0c275b728f3e0a4f19fac404c8f817cbc1ea47d5b66f02a7b9c18a232193dfde"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-linux-x64.tar.gz"
      sha256 "983e295033762d7cb0d837664dbdc06ba89686b48f723ff98034429a97d55c42"
    end
    on_arm do
      url "https://github.com/pavlovtech/WebReaper/releases/download/v11.3.0/webreaper-v11.3.0-linux-arm64.tar.gz"
      sha256 "b048cdc37c2eaf65614b782a48869e08c37a2c7f00a820cfd5b38d0038f483b2"
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
