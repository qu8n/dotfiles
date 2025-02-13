# Personal scripts
export PATH=$PATH:$HOME/.scripts
for dir in $HOME/.scripts/*/; do # include scripts inside subdirectories
    export PATH=$PATH:${dir%/}  # remove trailing slash
done

# Enable running globally-installed yarn packages like `depcheck`
# export PATH="$(yarn global bin):$PATH"

# Enable calling `protoc` from the terminal
# export PATH=$PATH:/Applications/protoc-26.1-osx-aarch_64/bin
