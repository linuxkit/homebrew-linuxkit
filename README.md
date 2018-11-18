Homebrew formulae for LinuxKit

If you have installed the commands before, you will want to delete
them first as they will conflict with the `brew` installed ones.


You can add these to your homebrew install with
```
brew tap linuxkit/linuxkit
```

Currently only the `linuxkit` formula has a release, for the latest stable
you can do
```
brew install linuxkit
```

You can install HEAD formulas, which update regularly with
```
brew install --HEAD linuxkit
brew install --HEAD rtf
brew install --HEAD manifest-tool
```

`HEAD` taps are a bit odd for upgrades, so upgrade with
```
brew reinstall --HEAD moby
```

To remove
```
brew remove linuxkit
brew untap linuxkit/linuxkit
```
