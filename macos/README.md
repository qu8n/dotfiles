# MacOS

My personal MacOS settings and setup flow on a new machine.

<!-- mtoc-start -->

* [Update System Preferences](#update-system-preferences)
  * [Login Items](#login-items)
* [Install software](#install-software)
  * [Run the install script](#run-the-install-script)
  * [CLI tool configurations](#cli-tool-configurations)
    * [gpg](#gpg)
    * [pass](#pass)
    * [trash-cli](#trash-cli)
  * [Mac App Store app installations](#mac-app-store-app-installations)
  * [GUI app configurations](#gui-app-configurations)
    * [License keys](#license-keys)
    * [AirBuddy](#airbuddy)
    * [Amazon Q](#amazon-q)
    * [Raycast](#raycast)
    * [Amphetamine](#amphetamine)
    * [Google Drive](#google-drive)
    * [Homerow](#homerow)
    * [Ice](#ice)
    * [Logi Options+](#logi-options)
    * [Lunar](#lunar)
    * [MacWhisper](#macwhisper)
    * [NetNewsWire](#netnewswire)
    * [Rectangle](#rectangle)
    * [Voicenotes](#voicenotes)
* [Diagnostics](#diagnostics)
  * [dotfiles](#dotfiles)
  * [Ghostty](#ghostty)

<!-- mtoc-end -->

## Update System Preferences

> [!NOTE]
> Consider automating this process with a script like [this one](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
> if I end up having to set up a new MacOS machine often.

* Desktop & Dock
  * Dock
    * Enable "Automatically hide and show the Dock"
    * Disable "Show suggested and recent apps in Dock"
  * Windows
    * Enable "Ask to keep changes when closing documents"
  * Hot Corners button
    * Disable all corners
* General
  * Login Items
    * See the list below
* Keyboard
  * Glide "Key repeat rate" to the fastest
  * Glide "Delay until repeat" to the shortest
  * Set "Press Globe key to" to "Do Nothing"
  * Enable "Keyboard navigation"
  * Touch Bar Settings button (if applicable)
    * Set both dropdown options to "Expanded Control Strip"
    * Disable "Show typing suggestions"
  * Keyboard Shortcuts button
    * Disable Spotlight shortcuts (for Raycast)
* Mouse
  * Tracking speed: 6 (with 1st level as 1)

### Login Items

Enable the following apps to launch at login/startup:

* AirBuddy
* Amazon Q
* Amphetamine
* BatFi
* Bitwarden
* CleanShot X
* Google Drive
* Homerow
* Ice
* Logi Options+
* Logi Tune
* MacWhisper
* NetNewsWire
* Raycast
* Rectangle
* Things
* Things Helper

## Install software

### Run the install script

Sign into the laptop with an Apple ID.

Run the install script:

```zsh
curl -Lks https://raw.githubusercontent.com/qu8n/dotfiles/refs/heads/main/macos/install.sh | /bin/zsh
```

During the execution of the script, ignore errors related to the following installs:

* `cleanshot` Homebrew cask (archived version)
* `tableplus` Homebrew cask (archived version)

Delete the old configs that were moved to `~/.config-backup` if no longer needed.

### CLI tool configurations

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
│   └── Tavily
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

### Mac App Store app installations

Install the following apps from the Mac App Store:

* Amphetamine
* Bitwarden
* iMovie
* Kindle
* Klack
* Things

> [!NOTE]
> This process can be automated with `mas-cli`, but I found it to be buggy. To
> revisit it if I have to set up a new MacOS machine often.

### GUI app configurations

#### License keys

Enter license keys found in my password manager for the following apps:

* AirBuddy
* BatFi
* CleanShot X
* Cold Turkey Blocker
* Replacicon
* Screen Studio
* TablePlus

#### AirBuddy

Go to Settings > Devices > Double-click on each device > Battery Alerts >
Low Battery > Enable these options:

* Notify me when battery goes below: 10%
* Notification type: "Standard macOS Notification"

In System Preferences > Notifications > AirBuddyHelper > toggle the "Alerts" option.

#### Amazon Q

Go to CLI Completions > Developer section, (1) enable "Dev mode" and (2) set the
"Specs folder" to `~/amazon-q/autocomplete/build`

#### Raycast

Onboarding:

* Set Command + Space as the hotkey
* Don't opt for Raycast emoji picker
* Enable access to everything

Import settings:

* Run `restore.sh` in `~/raycast/backup/` to unzip the `.gz` file back to `.rayconfig`
* Copy the zip password from my password manager
* Import the config by going to Raycast Settings > Advanced > Import > select the
`.rayconfig` file in `~/raycast/backup/` > enter the password

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

#### Google Drive

1. Sign in with my personal Google account & open Preferences
2. From the local machine, sync the "Documents" folder to Google Drive
3. From Google Drive, opt for the "Stream files" option
4. Settings > Turn off "Prompt me to back up devices"
5. Let the app sync in the background

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

#### Lunar

Set each monitor's brightness and contrast to 70% and 75%, respectively.

#### MacWhisper

Update the app settings as follows:

* General
  * App visibility mode: "Menubar Only"
* Dictation
  * Custom Keyboard Button: "Custom"
  * Custom Keyboard Shortcut: `Command + ;`
  * Activation Mode: "Push to Talk"
  * Enable "Play Dictation Sounds"
* Advanced
  * Analytics > Disable "Send Anonymous Analytics"

#### NetNewsWire

Sync to the cloud by going to Settings > Accounts > + > iCloud.

#### Rectangle

Import the config from `rectangle/` by going to `Rectangle > Preferences > Import`.

#### Voicenotes

Set the following hotkeys in the app settings:

* `Alt + Q` for recording meeting (like Vim's `q` command to start recording)
* `Alt + O` for recording note
* `Alt + X` to stop recording
* `Right Cmd + Right Ctrl` for dictation

## Diagnostics

### dotfiles

If `config list` doesn't show the latest changes from the remote dotfiles repo
and the `config pull` command doesn't work, then Git didn't fetch named branches
properly. Try the following:

```zsh
config fetch origin "+refs/heads/*:refs/remotes/origin/*"
config reset --hard origin/main
```

### Ghostty

Ghostty is a work in progress. Here are workarounds for some of the current
limitations, in addition to the ones addressed in the `config` file:

- When using `ssh` to connect to a remote server, backspace outputs a space
instead of deleting characters => [configure](https://ghostty.org/docs/help/terminfo#configure-ssh-to-fall-back-to-a-known-terminfo-entry)
the local `~/.ssh/config` file to fall back to a known `TERM` type
