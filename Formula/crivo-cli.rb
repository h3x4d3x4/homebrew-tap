# The Crivo command-line tool.
#
# A formula rather than a cask because this is a binary on the PATH, not an app in
# /Applications, and because a CLI is how Crivo reaches the people who can actually fix a
# broken exporter — the software houses, who are not on Macs either.
#
#   brew tap h3x4d3x4/tap
#   brew install crivo-cli
#
# Ships prebuilt rather than building from source: the repository is private, and a
# formula that cannot clone it would install nothing. The binary is universal, signed with
# Developer ID and notarised.
#
# scripts/build-cli.sh regenerates the version and checksum from the tarball it just built,
# so the two cannot drift apart.
class CrivoCli < Formula
  desc "SAF-T (PT) validator for Portuguese accountants, on the command line"
  homepage "https://crivo.hexadexa.io/"
  url "https://crivo.hexadexa.io/releases/crivo-cli-0.3.2.tar.gz"
  version "0.3.2"
  sha256 "bf9cbcbc541edabac98f1a65b321cf1b1c587ba03bbe9302de0e19646648c9d7"
  license :cannot_represent

  depends_on :macos
  depends_on macos: :sonoma

  def install
    # The resource bundle carries AT's schemas; without it beside the binary, validation
    # silently has no schema to validate against. libexec keeps them together and the
    # wrapper in bin puts crivo on the PATH.
    libexec.install "crivo", "CrivoKit_CrivoKit.bundle"
    bin.write_exec_script libexec/"crivo"
  end

  test do
    assert_match "regras", shell_output("#{bin}/crivo rules")
  end
end
