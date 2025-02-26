# [Homebrew](https://brew.sh/)

Makes it easy to install and manage packages on MacOS. Along with Bundle, we
can document existing packages and install them on a new machine with a single
command.

> [!IMPORTANT]
> Apps, including custom fonts, should be installed when possible via `brew`,
> `brew cask`, or `mas`. You can search if apps are available via `brew search`
> and `mas search`. Only download apps from the official website or the App Store
> if they are not available via `brew` or `mas`.

<!-- mtoc-start -->

* [Usage guide](#usage-guide)
  * [Exporting and importing Homebrew packages](#exporting-and-importing-homebrew-packages)
  * [Keeping Homebrew packages organized](#keeping-homebrew-packages-organized)
    * [Automatic cleanup](#automatic-cleanup)
    * [Manual cleanup](#manual-cleanup)
* [Resources](#resources)

<!-- mtoc-end -->

## Usage guide

### Exporting and importing Homebrew packages

On the current machine, save the list of currently installed packages to `Brewfile`:

```zsh
brew bundle dump --describe --force --file=~/homebrew/Brewfile
```

- `--describe` includes a description of each package
- `--force` overwrites the existing `Brewfile`
- `--file` specifies the path to the `Brewfile`

On a new machine, install packages from `Brewfile`:

```zsh
brew bundle install --file=~/homebrew/Brewfile
```

### Keeping Homebrew packages organized

When we run `brew install <package>`, Homebrew installs the package and its dependencies.
This means we often end up with an unruly list of packages when running `brew list`.

#### Automatic cleanup

```zsh
brew autoremove # uninstall hanging (no longer used) dependencies
brew cleanup # remove old versions of installed packages
```

#### Manual cleanup

The commands above do not remove packages that were manually installed as
dependencies but are no longer needed. To do so:

> [!CAUTION]
> Be careful when removing a package using this method. For example, some casks
> like `karabiner-elements` uses `xz` as a dependency, but the commands below don't
> show that. It's best to check the package's official documentation to see what
> dependencies it uses.

View packages and their dependencies:

```zsh
brew leaves | xargs brew deps --formula --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"
```

Alternatively, view packages that we specifically installed:

```zsh
brew desc $(brew list --installed-on-request) | column -t -s ":"
```

After confirming which packages we want to remove, run:

```zsh
brew uninstall <package>
# Alternative command for cask packages that also remove metadata
brew uninstall --zap <package>
```

## Resources

[ChristopherA/brew-bundle-brewfile-tips.md](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f)
