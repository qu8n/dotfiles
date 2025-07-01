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

# NeoVim
alias vi='nvim'
alias vizz="cd && vi $HOME/.zshrc"
alias viz="cd $HOME/zsh && vi" # [vi] [z]sh config
alias viv="cd $HOME/nvim && vi" # [vi] neo[v]im config
alias vig="vi $HOME/ghostty/config" # [vi] [g]hostty config

# python venv
alias vinit='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# Git (See oh-my-zsh git plugin's aliases before adding anything here with `alias | grep git`)
alias gl='git log --oneline --graph --all'
alias gbda='git branch | grep -v "master" | grep -v "main" | xargs git branch -D'

# dotfile management following the "Git Bare Repo" pattern (atlassian.com/git/tutorials/dotfiles)
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias c='config'
alias cst='config status'
alias cdf='config diff'
alias ca='config add'
alias crs='config restore'
alias crst='config restore --staged'
alias cl='config log --oneline --graph --all'
alias ccmsg='config commit --message'
alias ccam='config commit --all --message'
alias 'ccan!'='config commit --all --no-edit --amend'
alias cps='config push'
alias cop='config open'
alias cb='config blame main --' # usage: cb <file>

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

# Miscellaneous
alias yay='curl parrot.live'
alias path='echo -e ${PATH//:/\\n}' # pretty print the PATH variables
alias bbd="brew bundle dump --describe --force --file=$HOME/homebrew/Brewfile"
