# Let us run cmds like `git add` or `rm` with `fzf` magic
function gstf() {
  git status -s | fzf --multi | awk '{print $2}'
}

# Run `config add` with `fzf` magic
function cstf() {
  config status -s | fzf --multi | awk '{print $2}'
}

function zource() {
  source ~/.zshrc
}

function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}
