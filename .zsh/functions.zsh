# Run this with cmds like `git add` or `git restore` to pick from `git status` files
# e.g. `gstf "git add"`, `gstf ga` (alias is OK)
function gstf() {
  # -i is for interactive mode to enable accepting an alias arg
  # -c is for the command to run
  zsh -i -c "$1 $(git status -s | fzf --multi | awk '{print $2}')"
}

# Similar as above, but for dotfiles management
function cstf() {
  zsh -i -c "$1 $(config status -s | fzf --multi | awk '{print $2}')"
}

function t() {
  # Defaults to 3 levels deep, do more with e.g. `t 5`
  tree -I '.git|node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# Open the current branch in browser
function go() {
  local branch
  branch=$(git branch --format '%(refname:short)' | grep -E '^(main|master)$' | head -n 1)

  if [[ -z "$branch" ]]; then
    echo "Neither 'main' nor 'master' branch found."
    return 1
  fi

  # `git open` is made available by `git-open` plugin of oh-my-zsh
  git open origin "$branch"
}
