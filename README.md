Homebrew formulae for LinuxKit

If you have installed the commands before, you will want to delete
them first as they will conflict with the `brew` installed ones.


You can add these to your homebrew install with
```
brew tap linuxkit/linuxkit
```
then install with
```
brew install --HEAD moby
brew install --HEAD linuxkit
```

Currently only `HEAD` taps are available, but releases will be available later.

`HEAD` taps are a bit odd for upgrades, so upgrade with
```
brew reinstall --HEAD moby
brew reinstall --HEAD linuxkit
```

To remove
```
brew remove moby
brew remove linuxkit
brew untap linuxkit/linuxkit
```
