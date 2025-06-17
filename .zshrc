# Uncomment this command to profile the zsh startup time
# After sourcing this file, run `zprof` to see the results
# zmodload zsh/zprof

# Must keep at the beginning of the file
alias tp="trash-put" # put before amazon-q to access the autocompletion
source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
source $HOME/zsh/oh-my-zsh.zsh

# Tip: `gf` over the file path to quickly open it
source $HOME/zsh/paths.zsh
source $HOME/zsh/exports.zsh
source $HOME/zsh/sources.zsh
source $HOME/zsh/aliases.zsh
source $HOME/zsh/functions.zsh
source $HOME/zsh/ssh.zsh

# Must keep at the end of the file
source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
