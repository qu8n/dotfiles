# Let us run cmds like `git add` or `rm` with `fzf` magic
function gstf() {
  git status -s | fzf --multi | awk '{print $2}'
}

# Run `config add` with `fzf` magic
function cstf() {
  config status -s | fzf --multi | awk '{print $2}'
}
