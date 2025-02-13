# `git add` with `fzf` magic
function gaf() {
  git add $(git status -s | fzf --multi | awk '{print $2}')
}
