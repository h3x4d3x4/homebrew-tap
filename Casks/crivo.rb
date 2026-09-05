# Homebrew cask for Crivo.
#
# Lives here rather than in homebrew-cask proper: that repository requires a stable
# release history and a user base neither of which a beta has yet. Publish it by copying
# this file into the tap repository (h3x4d3x4/homebrew-tap) as Casks/crivo.rb, after
# which:
#
#   brew tap h3x4d3x4/tap
#   brew install --cask crivo
#
# scripts/make-cask.sh rewrites the version and checksum from the DMG that was just
# built, so the two cannot drift apart the way a hand-edited checksum does.
#
# auto_updates is true because the Developer ID build updates itself through Sparkle;
# without it Homebrew would report the app as outdated forever and offer to reinstall
# over a copy that had already updated itself.
cask "crivo" do
  version "0.2.9"
  sha256 "68988157b019b282b8db37da9567c1f4670aa80741f7c46ceff2c46a83dd235f"

  url "https://crivo.hexadexa.io/releases/Crivo-#{version}.dmg"
  name "Crivo"
  desc "SAF-T (PT) validator for Portuguese accountants"
  homepage "https://crivo.hexadexa.io/"

  livecheck do
    url "https://crivo.hexadexa.io/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Crivo.app"

  zap trash: [
    "~/Library/Containers/com.crivo.app",
    "~/Library/Application Support/Crivo",
  ]
end
