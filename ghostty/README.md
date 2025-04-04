# ghostty

Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses
platform-native UI and GPU acceleration.

![demo](https://miro.medium.com/v2/resize:fit:786/format:webp/0*0SXEOoelzGvwzY_2)

## Workarounds

Ghostty is a work in progress. Here are workarounds for some of the current
limitations, in addition to the ones addressed in the `config` file:

1. When using `ssh` to connect to a remote server, backspace outputs a space
instead of deleting characters => [configure](https://ghostty.org/docs/help/terminfo#configure-ssh-to-fall-back-to-a-known-terminfo-entry)
the local `~/.ssh/config` file to fall back to a known `TERM` type
