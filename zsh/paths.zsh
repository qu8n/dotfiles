# Expose scripts in the `~/scripts` to the terminal
export PATH=$PATH:$HOME/scripts
for dir in $HOME/scripts/*/; do # include scripts inside subdirectories
  export PATH=$PATH:${dir%/}  # remove trailing slash
done

# Enable running globally-installed yarn packages like `depcheck`
# export PATH="$(yarn global bin):$PATH"

# Expose brew packages to the terminal
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="/opt/homebrew/opt/trash-cli/bin:$PATH"

# For the Console Ninja VSCode extension
export PATH=~/.console-ninja/.bin:$PATH
