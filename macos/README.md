# MacOS

My personal MacOS settings and setup flow on a new machine.

<!-- mtoc-start -->

* [Update System Preferences](#update-system-preferences)
  * [Login Items](#login-items)
* [Install software](#install-software)
  * [Run the install script](#run-the-install-script)
  * [CLI tool configurations](#cli-tool-configurations)
    * [Prerequisites](#prerequisites)
    * [gpg](#gpg)
    * [pass](#pass)
    * [trash-cli](#trash-cli)
  * [GUI app configurations](#gui-app-configurations)
    * [License keys](#license-keys)
    * [Raycast](#raycast)
    * [Amphetamine](#amphetamine)
    * [Brave](#brave)
    * [Homerow](#homerow)
    * [Ice](#ice)
    * [Logi Options+](#logi-options)
    * [Logitech G HUB](#logitech-g-hub)
    * [Lunar](#lunar)
    * [NetNewsWire](#netnewswire)
    * [Rectangle](#rectangle)
* [Diagnostics](#diagnostics)
  * [dotfiles](#dotfiles)
  * [Amazon Q](#amazon-q)

<!-- mtoc-end -->

## Update System Preferences

> [!NOTE]
> There is no automated script like [this nice one](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
> because I don't set up a new MacOS machine often enough to warrant it.
> Also: [Maybe Don't Bother Scripting Some macOS System Preferences](https://assert.cc/posts/maybe-dont-script-macos-prefs/).

* Desktop & Dock
  * Dock
    * Enable "Automatically hide and show the Dock"
    * Disable "Show suggested and recent apps in Dock"
  * Windows
    * Enable "Ask to keep changes when closing documents"
  * Hot Corners button
    * Set top left to "Desktop"
    * Disable all other corners
* General
  * Login Items
    * See the list below
* Keyboard
  * Key repeat rate: max
  * Delay until repeat: min
  * Keyboard Shortcuts
    * Disable Spotlight shortcuts (for Raycast)
* Mouse
  * Tracking speed: 6 (with 1st level as 1)

### Login Items

* Amphetamine
* BatFi
* Bitwarden
* CleanShot X
* Homerow
* Ice
* Raycast
* Rectangle
* Things

## Install software

### Run the install script

Sign into the laptop with an Apple ID.

Run the install script:

```zsh
curl -Lks https://raw.githubusercontent.com/qu8n/dotfiles/refs/heads/main/macos/install.sh | /bin/zsh
```

During the execution of the script, ignore errors related to the following installs:

* `logitech-g-hub` Homebrew cask
* `cleanshot` Homebrew cask (archived version)
* `tableplus` Homebrew cask (archived version)

Delete the old configs that were moved to `~/.config-backup` if no longer needed.

### CLI tool configurations

#### Prerequisites

Open iTerm2. Load settings by following these steps:

1. Settings > General > Settings > Enable "Load settings from a custom folder
or URL" and set it to `~/iterm2/`
2. Quit and restart iTerm2
3. Ensure the settings were loaded successfully e.g. running `l` and check that
all icons are properly displayed. If not, repeat the steps above.
4. In the same Settings section, change Save change to "Automatically"

Start using iTerm2 as the default terminal.

#### gpg

On the source machine, export the GPG public and private keys and trust settings:

```zsh
# Replace <keyid>'s with the short public GPG key
gpg --export-secret-keys <keyid> > keys.gpg
gpg --export <keyid> >> keys.gpg
gpg --export-ownertrust > ownertrust.txt
```

Transfer `keys.gpg` and `~/.gnupg` to the new machine's $HOME using a secure method.

On the target machine, import the GPG keys and trust settings:

```zsh
gpg --import keys.gpg
gpg --import-ownertrust < ownertrust.txt
```

Fix permissions on the target machine:

```zsh
chown -R $(whoami) ~/.gnupg/
chmod 600 ~/.gnupg/*
chmod 700 ~/.gnupg
```

Create or edit `~/.gnupg/gpg-agent.conf` and add:

```zsh
pinentry-program /opt/homebrew/bin/pinentry-mac
default-cache-ttl 34560000
max-cache-ttl 34560000
```

Remove the transferred files on both machines:

```zsh
rm keys.gpg ownertrust.txt
```

#### pass

Reference my password manager and insert these passwords:
e.g. `pass insert APIKey/Anthropic`

```console
> pass show
Password Store
├── APIKey
│   ├── Anthropic
│   └── OpenAI
├── MSKCC
│   ├── Neo4j
│   ├── nguyenq2
│   └── smile
└── Raycast
    └── BackupZip
```

#### trash-cli

Add a cron job to auto delete files older that 30 days:

```zsh
(crontab -l ; echo "@daily $(which trash-empty) 30") | crontab -
```

This will update your crontab file with a `trash-empty` command that runs daily
and removes files older than 30 days. To review your crontab, run `crontab -l`.

### GUI app configurations

#### License keys

Enter license keys found in my password manager for the following apps:

* BatFi
* CleanShot X
* Cold Turkey Blocker
* Replacicon
* Screen Studio
* TablePlus

#### Raycast

Onboarding:

* Set Command + Space as the hotkey
* Don't opt for Raycast emoji picker
* Enable access to everything

Import settings:

* Run `restore.sh` in `~/raycast/` to unzip the `.gz` file back to `.rayconfig`
* Copy the zip password from my password manager
* Import the config from `~/raycast/` by going to Raycast Settings > Advanced >
Import > select the `.rayconfig` file > enter the password

#### Amphetamine

Enable the following in Settings:

* General
  * Launch Amphetamine at login
* Session Defaults
  * End session when Mac is forced to sleep
* System Control
  * Move cursor every 5 minutes after 5 minutes of inactivity
* Triggers
  * Enable Triggers
  * Create a trigger:
    * Name: "9 to 5"
    * Criterion: Mon-Fri, 9am*5pm
* Statistics
  * Disable "Enable statistics collection"

#### Brave

* Replace the default profile folder with backup
  * Drop in the backup Brave profile folders from Google Drive for Desktop into
`~/Library/Application\ Support/BraveSoftware/Brave-Browser/`
  * Set up the backing up of Brave profile(s) via Google Drive for Desktop by
syncing the corresponding profile folder(s) at `~/Library/Application\ Support/BraveSoftware/Brave-Browser/`
  * Note: On the source machine, to see which folder to sync for a profile, go
to `brave://version/` and look for the `Profile Path`
* Sync profile using Brave's Sync Chain
  * Follow the steps [here](https://support.brave.com/hc/en-us/articles/360021218111-How-do-I-set-up-Sync)
  * Note: Initialize the sync chain with the source machine

> [!NOTE]
> We use both syncing methods above because neither method is perfect. After testing
> separately, the first method resulted in missing extensions, while the second
> method resulted in missing settings. Doing both seems to be the best way to
> ensure everything is synced.

#### Homerow

Update the app settings as follows:

* General
  * Enable "Launch on login"
* Clicking
  * Set "Search Shortcut" as `Shift + Command + S`
  * Enable "Hide labels before search"
* Scrolling
  * Set "Shortcut" as `Shift + Command + O`
  * Set "Arrow keys" for "Scroll"

#### Ice

Update the app settings as follows:

* General
  * Enable "Launch on login"
  * Set "Ice icon" as the "Chevron"
  * Disable "Show on click" and "Show on scroll"
* Menu Bar Layout
  * Hide everything but Amphetamine, Wi-Fi, and Battery

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

#### Rectangle

Import the config from `rectangle/` by going to `Rectangle > Preferences > Import`.

## Diagnostics

### dotfiles

If `config list` doesn't show the latest changes from the remote dotfiles repo
and the `config pull` command doesn't work, then Git didn't fetch named branches
properly. Try the following:

```zsh
config fetch origin "+refs/heads/*:refs/remotes/origin/*"
config reset --hard origin/main
```

### Amazon Q

Running `q doctor` will show a warning about `zsh-autosuggestions` not being
supported at the same time. This is OK to ignore as they can both work together,
and it's nice to have both.
