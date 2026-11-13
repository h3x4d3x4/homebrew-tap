# Homebrew cask for Nacho Limits — published to h3x4d3x4/homebrew-tap by scripts/publish-tap.sh,
# which rewrites version and sha256 from the DMG GitHub is actually serving. Don't edit those
# two lines by hand: a checksum that disagrees with the file breaks `brew install` for everyone.
#
#   brew tap h3x4d3x4/tap
#   brew install --cask nacholimits
#
# auto_updates: the app updates itself through Sparkle. `binary` links the `nacho` command.
# Uninstalling doesn't touch Claude Code's settings: Disconnect in the app restores them first.
cask "nacholimits" do
  version "0.3.19"
  sha256 "5044b850adeaf2698e12c572c012cb83bd9ad42c9e83145199a7209f8b2743b5"

  url "https://github.com/h3x4d3x4/NachoLimits-releases/releases/download/v#{version}/NachoLimits.dmg"
  name "Nacho Limits"
  desc "AI plan limits in the MacBook notch"
  homepage "https://nacholimits.hexadexa.io/"

  livecheck do
    url "https://raw.githubusercontent.com/h3x4d3x4/NachoLimits-releases/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "NachoLimits.app"
  binary "#{appdir}/NachoLimits.app/Contents/Helpers/nacho"

  uninstall quit: "com.hexadexa.NachoLimits"

  zap trash: [
    "~/Library/Application Support/NachoLimits",
    "~/Library/Group Containers/632VXL3W66.com.hexadexa.NachoLimits",
    "~/Library/Caches/com.hexadexa.NachoLimits",
    "~/Library/HTTPStorages/com.hexadexa.NachoLimits",
    "~/Library/Preferences/com.hexadexa.NachoLimits.plist",
  ]
end
