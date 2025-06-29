# dotfiles

My development environment configuration files, scripts, and tools on macOS.

![screenshot](https://i.postimg.cc/66sY5bdR/Clean-Shot-2025-05-25-at-08-26-53.jpg)

## Shortcuts Cheatsheet

### Vim / NeoVim / LazyVim

#### Navigation

* Position current line to center of screen: `zz`
* Position current line to top of screen: `zt`
* Toggle fold on current line: `za`
* Move cursor to the corresponding bracket: `%` (e.g. move from `(` to `)`)

#### Searching

* Start search forward on current word: `*`
* Start search backward on current word: `#`
* Toggle `flash.nvim` labels during search `/`: `Ctrl + s`
* Search through previous commands: `q:` or `<leader>sc` (LazyVim)
* Search through previous searches: `q/`

#### Editing

* Delete previous word: `Ctrl + w` (insert mode)
* Toggle comment on current line: `gcc` (normal mode), `gc` (visual mode)
* Indent current line by one level: `>>`
* Auto-indent current visually selected lines: `=`

#### Vim Surround (via `mini-surround`)

* Remove characters inside brackets or quotes: `ci(`, `ci"`, etc.
  * Apply similar operations with `[d]elete` and `[y]ank`
* Add surrounding characters (normal and visual modes):
  * For the word under the cursor: `gs + aiw + <char>`
  * For the visually selected text: `gs + a + <char>`
  * When adding brackets, use the closing bracket (e.g. `)`) to avoid
  adding space around the selection

#### Multi-Cursor Editing

* Edit multiple lines with Visual Block mode: `Ctrl + v`
* Edit matches of current visual selection: `Ctrl + n` (via `vim-visual-multi`)

#### Buffer/Window Management

* Resize split windows: `Ctrl + <arrow>`
* Move between splits: `Ctrl + h/j/k/l`
* Move between buffers: `Shift + h/l`

#### Other Useful Commands

* View and run past commands: `q:` (Vim) or `<leader>sc` (LazyVim)
* Manage LSP servers: `:Mason`
* Temporarily suspend NeoVim and return to terminal: `Ctrl + z`
* Resume NeoVim from terminal: `fg`

### Ghostty

* Open Ghostty: `Opt + g` (via Raycast hotkey)
* Move between splits: `Cmd + [/]`
* Resize current split: `Ctrl + Cmd + <arrow>`
* Switch between recently used tabs: `Ctrl + Tab`

### Things3

* Open link under cursor: `Opt + Cmd + Enter`
