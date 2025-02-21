# MacOS

My personal MacOS settings and setup flow on a new machine.

## Update System Preferences

> [!NOTE]
> There is no automated script like [this nice one](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
> because I don't set up a new MacOS machine often enough to warrant it.
> Also: [Maybe Don't Bother Scripting Some macOS System Preferences](https://assert.cc/posts/maybe-dont-script-macos-prefs/).

- Keyboard
  - Key repeat rate: max
  - Delay until repeat: min
- Mouse
  - Tracking speed: 6 (with 1st level as 1)

## Install software

## Install Xcode Command Line Tools, Homebrew, and Git

```zsh
# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Xcode installed the Apple Git version, but Homebrew's Git is more up-to-date
brew install git
```
## Set up dotfiles tracker

Follow the instructions at "Installing your dotfiles onto a new system" [here](https://www.atlassian.com/git/tutorials/dotfiles).

### Install apps via Homebrew

```zsh
brew bundle --file ~/.homebrew/Brewfile
```

### Install apps manually

To be filled.

### Set up apps after installation

#### Brave & Google Drive for Desktop

Drop in the backup Brave profile folders from Google Drive for Desktop into
`~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.

Set up the backing up of Brave profile(s) via Google Drive for Desktop by
syncing the corresponding profile folder(s) at `~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.
To see which folder to sync for a profile, go to `brave://version/` and look
for the `Profile Path`.

#### Rectangle

Import the config from `.rectangle/` by going to `Rectangle > Preferences > Import`.

## Appendix

### App quirks

### Amazon Q

Running `q doctor` will show a warning about `zsh\-autosuggestions` not being supported at the same time.

OK to ignore as they can both work together, and it's nice to have both.
