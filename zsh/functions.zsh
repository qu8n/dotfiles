# Run this with cmds like `git add` or `git restore` to pick from `git status` files
# [g]it [st]atus [f]zf
# Usage: `gstf "git add"`, `gstf ga` (alias is OK)
gstf() {
  # -i is for interactive mode to enable accepting an alias arg
  # -c is for the command to run
  zsh -i -c "$1 $(git status -s | fzf --multi | awk '{print $2}')"
}

# Similar as above, but for dotfiles management
# [c]onfig [st]atus [f]zf
cstf() {
  zsh -i -c "$1 $(config status -s | fzf --multi | awk '{print $2}')"
}

# List files in a tree-like structure
t() {
  # Defaults to 3 levels deep, do more with e.g. `t 5`
  tree -I '.git|node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# Open the current branch in browser
# [g]it [o]pen
go() {
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
# [c]onfig [a]dd [a]ll
caa() {
  # `config add` all files currently tracked by `config`
  config add $(config status -s | awk '{print $2}')

  # `config add` all directories currently tracked by `config`
  # (`config` wouldn't know to track new files in these directories unless they
  # are added explicitly)
  curr_dir=$(pwd)
  cd $HOME
  for dir in $(config ls-files | awk -F'/' '{print $1}' | sort -u | grep -v '^$'); do
    if [[ -d $dir ]]; then
      echo "~/$dir"
      config add "$dir"
    fi
  done
  cd "$curr_dir"
}

# Safeguard `rm` command
# (Don't alias `rm` to `trash-put` because some `rm` flags might not be
# supported. Also, this introduces bad habits when working in other machines.)
rm() {
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
# [m]kdir and [c]d
mc() {
  mkdir -p "$@" && cd "$_"
}

# `cd` into a directory and `vi` in one go
# [c]d and [v]i
cv() {
  if [[ -d "$1" ]]; then
    cd "$1" && vi
  else
    echo "Error: '$1' is not a directory." >&2
    return 1
  fi
}

# Move a file from ~/Downloads to the current directory
# [m]ove [f]rom [d]ownloads
# Usage: `mfd filename` or `mfd "dirname"`
mfd() {
  local src="$HOME/Downloads/$1"
  if [[ -e "$src" ]]; then
    mv "$src" .
    echo "Moved $1 to $(pwd)"
  else
    echo "Error: '$1' not found in ~/Downloads" >&2
    return 1
  fi
}

# Get 10 samples of shell startup time
# (The 1st column shows the total startup time in each run)
timezsh() {
  for i in $(seq 1 10); do /usr/bin/time $SHELL -i -c exit; done
}
