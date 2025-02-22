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

To be determined.

### Set up apps after installation

#### Brave & Google Drive for Desktop

Drop in the backup Brave profile folders from Google Drive for Desktop into
`~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.

Set up the backing up of Brave profile(s) via Google Drive for Desktop by
syncing the corresponding profile folder(s) at `~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.
To see which folder to sync for a profile, go to `brave://version/` and look
for the `Profile Path`.

#### Amphetamine

Enable the following in Settings:

- General
  - Launch Amphetamine at login
  - Hide Amphetamine in the Dock
- Session Defaults
  - End session when Mac is forced to sleep
  - Move cursor every 5 minutes after 5 minutes of inactivity
- Triggers
  - Enable Triggers
  - Create a trigger:
    - Name: "9 to 5"
    - Criterion: Mon-Fri, 9am-5pm
- Statistics
  - Disable "Enable statistics collection"

#### BatFi

Enter the license key found in my password manager.

#### CleanShot X

`brew` installs the latest version of CleanShot X, which isn't covered by my
license key. Follow these steps to downgrade to the version that is covered:

Uninstall the cleanshot brew cask:

```zsh
brew uninstall --zap cleanshot

```

Install the old version:

```zsh
brew install --HEAD -s ~/.homebrew/archived-versions/cleanshot.rb
```

Finally, enter the license key found in my password manager.

> [!TIP]
> Here is how to find the archived version of a cask, in case I need to repeat
> this process for another app: Go to the main Homebrew page of the cask (e.g.
> [cleanshot](https://formulae.brew.sh/cask/cleanshot)) > Cask code on Github >
> History > click on the commit name of the desired version > ellipsis (...) >
> View file > Raw > copy the URL, then download it with `curl` or `wget` into ~/.homebrew/archived-versions.

#### Cold Turkey Blocker

Enter the license key found in my password manager.

#### Logi Options+

Set the pointer speed of the Logitech MX Vertical to 80%.

#### Logitech G HUB

Set the Logitech Brio webcam as follows:

- Preset: ZOOM 1.5x
- Field of view: 90°
- Zoom: 150%

#### Lunar

Set each monitor's brightness and contrast to 70% and 75%, respectively.

#### NetNewsWire

Sync to cloud by going to Settings > Accounts > + > iCloud.

#### Rectangle

Import the config from `.rectangle/` by going to `Rectangle > Preferences > Import`.

## Appendix

### App quirks

### Amazon Q

Running `q doctor` will show a warning about `zsh-autosuggestions` not being
supported at the same time.

OK to ignore as they can both work together, and it's nice to have both.
