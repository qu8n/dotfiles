# Personal scripts
export PATH=$PATH:$HOME/.scripts
for dir in $HOME/.scripts/*/; do # include scripts inside subdirectories
    if [[ ${dir:t:r} != "raycast" ]]; then  # exclude raycast directory
        export PATH=$PATH:${dir%/}  # remove trailing slash
    fi
done

# Enable running globally-installed yarn packages like `depcheck`
# export PATH="$(yarn global bin):$PATH"

# Expose asdf packages to the terminal
export PATH="$HOME/.asdf/shims:$PATH"

# For the Console Ninja VSCode extension
export PATH=~/.console-ninja/.bin:$PATH
