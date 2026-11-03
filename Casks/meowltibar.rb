cask "meowltibar" do
  version "0.1.1"
  sha256 "0298f326e88dce0421aa499d7811946de9d43b6e540a2aa5081927354047b007"

  url "https://github.com/jiyoung-e/meowlti/releases/download/v#{version}/MeowltiBar-#{version}.zip"
  name "MeowltiBar"
  desc "Menu bar app for running multiple Claude and Codex accounts side by side"
  homepage "https://github.com/jiyoung-e/meowlti"

  livecheck do
    url "https://github.com/jiyoung-e/meowlti/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on formula: "jiyoung-e/tap/meowlti"
  depends_on macos: :sonoma

  app "MeowltiBar.app"

  # Only the app's own settings; profiles in ~/.meowlti belong to the meowlti CLI.
  zap trash: [
    "~/Library/Caches/io.github.jiyoung-e.meowltibar",
    "~/Library/HTTPStorages/io.github.jiyoung-e.meowltibar",
    "~/Library/Preferences/io.github.jiyoung-e.meowltibar.plist",
  ]
end
