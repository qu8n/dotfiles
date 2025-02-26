# [Raycast](https://www.raycast.com/)

Modern alternative to macOS' built-in Spotlight.

Raycast is crucial to my workflow. I use it to quickly open apps, run scripts,
access clipboard history, and more, seriously saving me from installing a horde
of other third-party apps.

![demo](https://stadt-bremerhaven.de/wp-content/uploads/2023/05/raycast_.jpg)

## Exporting and importing settings

I'm on the Free plan, which means I occasionally do a manual backup of my settings.

Backup steps:

1. Go to Raycast Settings > Advanced > Export
2. Save it to this directory
3. Run the `backup.sh` script to password protect the config file

Import steps:

1. Run the `restore.sh` script to unzip the config file
2. Go to Raycast Settings > Advanced > Import
