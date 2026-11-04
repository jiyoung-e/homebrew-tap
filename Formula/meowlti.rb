class Meowlti < Formula
  desc "Run multiple Claude and Codex accounts side by side on one Mac"
  homepage "https://github.com/jiyoung-e/meowlti"
  url "https://github.com/jiyoung-e/meowlti/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "355a55e31885c831a245129c7c32ca0db1351cb95b5454ff87789836bcbca1f2"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :macos

  def install
    bin.install "meowlti"
  end

  def caveats
    <<~EOS
      To let plain `claude` / `codex` use the profile bound to the current folder:
        meowlti shell-init --install

      The menu bar app is a separate cask:
        brew install --cask jiyoung-e/tap/meowltibar
    EOS
  end

  test do
    assert_match "meowlti #{version}", shell_output("#{bin}/meowlti --version")
    ENV["MEOWLTI_HOME"] = testpath/"home"
    ENV["MEOWLTI_LAUNCHERS"] = testpath/"launchers"
    system bin/"meowlti", "add", "demo"
    assert_match "demo", shell_output("#{bin}/meowlti ls")
  end
end
