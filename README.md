# Hexadexa tap

The app:

```
brew tap h3x4d3x4/tap
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
