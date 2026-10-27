class Meowlti < Formula
  desc "Run multiple Claude and Codex accounts side by side on one Mac"
  homepage "https://github.com/jiyoung-e/meowlti"
  url "https://github.com/jiyoung-e/meowlti/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d26cfdb47ec89666d7982fca0ca61d82b14a84f1b2d7e3a81c100a9298bb0b01"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on :macos

  def install
    bin.install "meowlti"
  end

  def caveats
    <<~EOS
      To let plain `claude` / `codex` use the profile bound to the current folder:
        meowlti shell-init --install
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
