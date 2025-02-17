# Homebrew

Homebrew makes it easy to install packages on MacOS. With Bundle, we can document
existing packages and install them on a new machine with a single command.

## Useful commands

### Document existing packages and install them on a new machine

Save the list of currently installed packages to `Brewfile`:

```bash
brew bundle dump --force --file=~/.homebrew/Brewfile
```

- `--force` overwrites the existing `Brewfile`
- `--file` specifies the path to the `Brewfile`

Install packages from `Brewfile`:

```bash
brew bundle install --file=~/.homebrew/Brewfile
```

### Organizing Homebrew packages

When we run `brew install <package>`, Homebrew installs the package and its dependencies.
This means we often end up with an unruly list of packages when running `brew list`.

To manage and safely delete packages we no longer need, use the following commands:

View packages and their dependencies:

```bash
brew leaves | xargs brew deps --formula --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/"
```

Alternatively, view packages that we specifically installed:

```bash
brew desc $(brew list --installed-on-request) | column -t -s ":"
```

After confirming which packages we want to remove, run:

```bash
brew uninstall <package>
```

### Resource

[ChristopherA/brew-bundle-brewfile-tips.md](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f)
