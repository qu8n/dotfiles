# Uncomment this command to profile the zsh startup time
# After sourcing this file, run `zprof` to see the results
# zmodload zsh/zprof

# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# Tip: `gf` over the file path to quickly open it
source $HOME/zsh/oh-my-zsh.zsh # must run first
source $HOME/zsh/paths.zsh
source $HOME/zsh/exports.zsh
source $HOME/zsh/sources.zsh
source $HOME/zsh/aliases.zsh
source $HOME/zsh/functions.zsh
source $HOME/zsh/ssh.zsh

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
