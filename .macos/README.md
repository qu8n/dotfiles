# MacOS

Below are my personal MacOS settings and setup, described in plain English.

I opted out of having an [automated script](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
because I don't set up a new MacOS machine often enough to warrant it,
and because of the reasons listed in this article:
[Maybe Don't Bother Scripting Some macOS System Preferences](https://assert.cc/posts/maybe-dont-script-macos-prefs/).

## System Preferences

- Keyboard
  - Key repeat rate: fastest
  - Delay until repeat: shortest
- Mouse
  - Tracking speed: 6 (with 1st level as 1)

## Application installations

> [!IMPORTANT]
> Apps, including custom fonts, should be installed if possible via `brew`,
> `brew cask`, or `mas`. You can search if apps are available via `brew search`
> and `mas search`.

### Apps installed via Homebrew

See `.homebrew/` for more details.

### Apps to be manually installed

To be filled.

### App setups

Instructions on how to set up apps after installation.

#### Brave & Google Drive for Desktop

Drop in the backup Brave profile folders from Google Drive for Desktop into
`~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.

Set up the backing up of Brave profile(s) via Google Drive for Desktop by
syncing the corresponding profile folder(s) at `~/Library/Application\ Support/BraveSoftware/Brave-Browser/`.
To see which folder to sync for a profile, go to `brave://version/` and look
for the `Profile Path`.

#### Rectangle

Import the config from `.rectangle/` by going to `Rectangle > Preferences > Import`.
