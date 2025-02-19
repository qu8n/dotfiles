function zource() {
  source ~/.zshrc
}

# Run `git add` with `fzf` magic
function gaf() {
  git add $(git status -s | fzf --multi | awk '{print $2}')
}

# Run `config add` with `fzf` magic
function caf() {
  config add $(config status -s | fzf --multi | awk '{print $2}')
}

function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
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
