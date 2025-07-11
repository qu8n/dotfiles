# Aliases set here override those provided by Oh My Zsh libs, plugins, and themes

alias zource="source $HOME/.zshrc"

# Personal directories
alias sd="cd $HOME/dev/mskcc/smile-dashboard"
alias ss="cd $HOME/dev/mskcc/smile-server"
alias srf="cd $HOME/dev/mskcc/smile-request-filter"
alias smp="cd $HOME/dev/mskcc/smile-message-publisher"
alias sconf="cd $HOME/dev/mskcc/smile-configuration"
alias su="cd $HOME/dev/mskcc/smile-utils"
alias sc="cd $HOME/dev/mskcc/smile-commons"

# Quick access to configs
alias vizz="cd && nvim $HOME/.zshrc"
alias viz="cd $HOME/zsh && nvim ." # [vi] [z]sh
alias viv="cd $HOME/nvim && nvim ." # [vi] neo[v]im
alias vig="nvim $HOME/ghostty/config" # [vi] [g]hostty

# python venv
alias vinit='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# Git (See oh-my-zsh git plugin's aliases before adding anything here with `alias | grep git`)
alias gl='git log --oneline --graph --all'
alias gbda='git branch | grep -v "master" | grep -v "main" | xargs git branch -D'

# dotfiles management following the "Git Bare Repo" pattern
# https://www.atlassian.com/git/tutorials/dotfiles
alias x="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias xst='x status'
alias xd='x diff'
alias xa='x add'
alias xrs='x restore'
alias xl='x log --oneline --graph --all'
alias xc='x commit'
alias 'xc!'='x commit --verbose --amend'
alias xcmsg='x commit --message'
alias xcam='x commit --all --message'
alias 'xcan!'='x commit --all --no-edit --amend'
alias xp='x push'
alias xpf='x push --force'
alias xop='x open'
alias xb='x blame main --' # usage: xb <file>

# Shortcuts for common commands
alias tp='trash-put' # safer rm
alias l='eza -al --icons --color=always --group-directories-first'
alias h='history'
alias py='python3'
alias python='python3'
alias cat='bat' # cat clone with syntax highlighting

# Quick greps
alias lg='eza -al --icons --color=always --group-directories-first | grep'
alias eg='env | grep'
alias ag="alias | grep"
alias hg='history | grep'
alias brg='brew list --versions | grep'

# Homebrew
alias bbd="brew bundle dump --describe --force --file=$HOME/homebrew/Brewfile"
alias bbi="brew bundle install --file=$HOME/homebrew/Brewfile --no-upgrade --no-lock"

# Miscellaneous
alias path='echo -e ${PATH//:/\\n}' # pretty print the PATH variables
alias yay='curl parrot.live'
alias c="claude"
