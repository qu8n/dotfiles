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

# Improve `config add --all` command
function caa() {
  # `config add` all files shown by `config status`
  config add $(config status -s | awk '{print $2}')

  # `config add` all directories currently tracked by `config`
  # (This is because `config` wouldn't know to track new files in these
  # directories unless they are added explicitly)
  echo "Checking for changes inside tracked directories:"
  curr_dir=$(pwd)
  cd $HOME
  config ls-files | awk -F'/' '{print $1}' | sort -u | grep -v '^$' | \
      xargs -I {} zsh -ic 'source ~/zsh/aliases.zsh; test -d {} && echo "~/{}" && config add {}'
  cd "$curr_dir"
}

# Safeguard `rm` command
# (Don't alias `rm` to `trash-put` because some `rm` flags might not be
# supported. Also, this introduces bad habits when working in other machines.)
function rm() {
  echo "Use trash-put (alias tp) instead. To proceed anyway, prepend a backslash to rm."
  echo ""
  echo "All trash-cli commands:"
  echo "trash-put (tp)      trash files and directories"
  echo "trash-empty         empty the trashcan(s)"
  echo "trash-list          list trashed files"
  echo "trash-restore       restore a trashed file"
  echo "trash-rm            remove individual files from the trashcan"
}

# Create a directory and `cd` into it in one go
mkd() {
  mkdir -p "$@" && cd "$_"
}

# `cd` into a directory and `vi` in one go
cv() {
  if [[ -d "$1" ]]; then
    cd "$1" && vi
  else
    echo "Error: '$1' is not a directory." >&2
    return 1
  fi
}
