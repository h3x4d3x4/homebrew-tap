# Hexadexa tap

```
brew tap h3x4d3x4/tap
```

## LidBoot

```
brew trust --cask h3x4d3x4/tap/lidboot
brew install --cask lidboot
```

**LidBoot** — stops your MacBook starting up when you open the lid or connect power. Two
switches for Apple's documented `BootPreference` setting. Apple silicon, macOS 15+, free
and open source. [lidboot.hexadexa.io](https://lidboot.hexadexa.io/) ·
[source](https://github.com/h3x4d3x4/LidBoot)

The cask is written by `app/scripts/publish-tap.sh` in the LidBoot repository from the DMG
GitHub is actually serving, so its checksum cannot drift from the file it points at.

## Crivo

The app:

```
brew trust --cask h3x4d3x4/tap/crivo
brew install --cask crivo
```

The command-line tool, which runs the same engine:

```
brew install crivo-cli
crivo validate saft.xml
```

**Crivo** — a SAF-T (PT) validator for Portuguese accountants. Reads the file on your own
Mac; nothing is uploaded. [crivo.hexadexa.io](https://crivo.hexadexa.io/)

The cask is generated from the DMG that was actually published, by
`app/scripts/make-cask.sh` in the Crivo repository, so its checksum cannot drift from the
file it points at.
