# dotfiles

[Dotfiles are meant to be forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)
and shared so we can all learn from each other. However, they're also very
personal, so I recommend taking a look around and picking what you like.

I've added comments and READMEs throughout so you can quickly understand what
each item (command, script, app, etc.) does. Enjoy! 🏄

## File structure

This dotfiles repository's root mirrors my `$HOME` directory. By default, I
organize configs in their own directories inside `$HOME/` to keep things tidy.
However, some tools are strict about saving their configs in `~/.config`.

`./macos/README.md` contains my macOS setup guide, which includes a list of
steps to configure a new machine and import my saved settings.

There are also READMEs in each directory to explain what's inside, like what
the tool is, what I use it for, "cheat sheet"-like commands, etc.

## (In)frequently asked questions

### How do you track your dotfiles?

I track mine following the [Git bare repository strategy](https://www.atlassian.com/git/tutorials/dotfiles)
for its simplicity. There are many amazing tools out there, so I recommend you
to check them out before deciding. As a starting resource, see [this guide](https://dotfiles.github.io/).
