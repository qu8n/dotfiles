# MacOS

My personal MacOS settings and setup flow on a new machine.

<!-- mtoc-start -->

* [Update System Preferences](#update-system-preferences)
* [Install software](#install-software)
  * [Run the install script](#run-the-install-script)
  * [CLI tool configurations](#cli-tool-configurations)
    * [pass](#pass)
    * [trash-cli](#trash-cli)
  * [GUI app configurations](#gui-app-configurations)
    * [License keys](#license-keys)
    * [Raycast](#raycast)
      * [Onboarding](#onboarding)
      * [Import settings](#import-settings)
    * [Amphetamine](#amphetamine)
    * [Brave](#brave)
    * [iTerm2](#iterm2)
    * [Logi Options+](#logi-options)
    * [Logitech G HUB](#logitech-g-hub)
    * [Lunar](#lunar)
    * [NetNewsWire](#netnewswire)
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
  * Keyboard Shortcuts
    * Disable Spotlight shortcuts (for Raycast)
* Mouse
  * Tracking speed: 6 (with 1st level as 1)

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

##### Onboarding

* Set Command + Space as the hotkey
* Don't opt for Raycast emoji picker
* Enable access to everything

##### Import settings

Run `restore.sh` in `~/raycast/` to unzip the `.gz` file back to `.rayconfig`.

Copy the zip password from my password manager.

Import the config from `~/raycast/` by going to Raycast
Settings > Advanced > Import > select the `.rayconfig` file > enter the password.

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
    * Criterion: Mon-Fri, 9am*5pm
* Statistics
  * Disable "Enable statistics collection"

#### Brave

Drop in the backup Brave profile folders from Google Drive for Desktop into
`~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.

Set up the backing up of Brave profile(s) via Google Drive for Desktop by
syncing the corresponding profile folder(s) at `~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.

> [!NOTE]
> To see which folder to sync for a profile, go to `brave://version/` and look
> for the `Profile Path`.

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

#### Rectangle

Import the config from `rectangle/` by going to `Rectangle > Preferences > Import`.

## Appendix

### App quirks

#### Amazon Q

Running `q doctor` will show a warning about `zsh-autosuggestions` not being
supported at the same time. This is OK to ignore as they can both work together,
and it's nice to have both.
