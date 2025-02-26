# MacOS

My personal MacOS settings and setup flow on a new machine.

<!-- mtoc-start -->

* [Update System Preferences](#update-system-preferences)
* [Install software](#install-software)
  * [Prerequisites](#prerequisites)
  * [Set up dotfiles tracker](#set-up-dotfiles-tracker)
  * [Install apps via Homebrew](#install-apps-via-homebrew)
    * [Versioning & licensing](#versioning--licensing)
  * [CLI tool configurations](#cli-tool-configurations)
    * [trash-cli](#trash-cli)
  * [GUI app configurations](#gui-app-configurations)
    * [Amphetamine](#amphetamine)
    * [Brave & Google Drive for Desktop](#brave--google-drive-for-desktop)
    * [iTerm2](#iterm2)
    * [Logi Options+](#logi-options)
    * [Logitech G HUB](#logitech-g-hub)
    * [Lunar](#lunar)
    * [NetNewsWire](#netnewswire)
    * [Raycast](#raycast)
    * [Rectangle](#rectangle)
* [Appendix](#appendix)
  * [App quirks](#app-quirks)
    * [Amazon Q](#amazon-q)

<!-- mtoc-end -->

## Update System Preferences

> [!NOTE]
> There is no automated script like [this nice one](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
> because I don't set up a new MacOS machine often enough to warrant it.
> Also: [Maybe Don't Bother Scripting Some macOS System Preferences](https://assert.cc/posts/maybe-dont-script-macos-prefs/).

* Keyboard
  * Key repeat rate: max
  * Delay until repeat: min
* Mouse
  * Tracking speed: 6 (with 1st level as 1)

## Install software

### Prerequisites

```zsh
# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Xcode installed the Apple Git version, but Homebrew's Git is more up-to-date
brew install git
```

### Set up dotfiles tracker

Follow the instructions at "Installing your dotfiles onto a new system" [here](https://www.atlassian.com/git/tutorials/dotfiles).

Create symlinks for these directories:

```zsh
ln -s ~/nvim ~/.config/nvim
ln -s ~/karabiner ~/.config/karabiner
```

### Install apps via Homebrew

```zsh
brew bundle --file ~/homebrew/Brewfile
```

#### Versioning & licensing

I've purchased the license keys for older versions of some apps. `brew install`
downloads the binary for the latest version, which isn't covered by my license.
Run these commands to downgrade to the version that is covered:

```zsh
# Uninstall the latest version
brew uninstall --zap cleanshot
brew uninstall --zap tableplus
# Install the old version
brew install --HEAD -s ~/homebrew/archived-versions/cleanshot.rb
brew install --HEAD -s ~/homebrew/archived-versions/tableplus.rb
```

> [!TIP]
> Here is how to find the archived version of a cask, in case I need to repeat
> this process for another app: Go to the main Homebrew page of the cask (e.g.
> [cleanshot](https://formulae.brew.sh/cask/cleanshot)) > Cask code on Github >
> History > click on the commit name of the desired version > ellipsis (...) >
> View file > Raw > copy the URL, then download it with `curl` or `wget` into ~/homebrew/archived-versions.

Enter license keys found in my password manager for the following apps:

* BatFi
* CleanShot X
* Cold Turkey Blocker
* Replacicon
* Screen Studio
* TablePlus

### CLI tool configurations

#### trash-cli

Add a cron job to auto delete files older that 30 days:

```zsh
(crontab -l ; echo "@daily $(which trash-empty) 30") | crontab -
```

This will update your crontab file with a `trash-empty` command that runs daily
and removes files older than 30 days. To review your crontab, run `crontab -l`.

### GUI app configurations

#### Amphetamine

Enable the following in Settings:

* General
  * Launch Amphetamine at login
  * Hide Amphetamine in the Dock
* Session Defaults
  * End session when Mac is forced to sleep
  * Move cursor every 5 minutes after 5 minutes of inactivity
* Triggers
  * Enable Triggers
  * Create a trigger:
    * Name: "9 to 5"
    * Criterion: Mon*Fri, 9am*5pm
* Statistics
  * Disable "Enable statistics collection"

#### Brave & Google Drive for Desktop

Drop in the backup Brave profile folders from Google Drive for Desktop into
`~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.

Set up the backing up of Brave profile(s) via Google Drive for Desktop by
syncing the corresponding profile folder(s) at `~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.
To see which folder to sync for a profile, go to `brave://version/` and look
for the `Profile Path`.

#### iTerm2

Load settings by following these steps:

1. Settings > General > Settings > Enable "Load settings from a custom folder
or URL" and set it to `~/iterm2/`
2. Quit and restart iTerm2
3. In the same Settings section, change Save change to "Automatically"

#### Logi Options+

Set the pointer speed of the Logitech MX Vertical to 80%.

#### Logitech G HUB

Set the Logitech Brio webcam as follows:

* Preset: ZOOM 1.5x
* Field of view: 90°
* Zoom: 150%

#### Lunar

Set each monitor's brightness and contrast to 70% and 75%, respectively.

#### NetNewsWire

Sync to the cloud by going to Settings > Accounts > + > iCloud.

#### Raycast

Run `restore.sh` in `~/raycast/` to unzip the `.gz` file back to `.rayconfig`.

Copy the zip password from my password manager.

Open the app. During onboarding, set Command + Space as the hotkey.

After onboarding, import the config from `~/raycast/` by going to Raycast
Settings > Advanced > Import > select the `.rayconfig` file > enter the password.

#### Rectangle

Import the config from `rectangle/` by going to `Rectangle > Preferences > Import`.

## Appendix

### App quirks

#### Amazon Q

Running `q doctor` will show a warning about `zsh-autosuggestions` not being
supported at the same time. This is OK to ignore as they can both work together,
and it's nice to have both.
