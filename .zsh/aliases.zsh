# Aliases set here override those provided by Oh My Zsh libs, plugins, and themes

# Personal directories
alias sd="cd $HOME/dev/mskcc/smile-dashboard"
alias ss="cd $HOME/dev/mskcc/smile-server"
alias srf="cd $HOME/dev/mskcc/smile-request-filter"
alias smp="cd $HOME/dev/mskcc/smile-message-publisher"
alias sconf="cd $HOME/dev/mskcc/smile-configuration"
alias su="cd $HOME/dev/mskcc/smile-utils"
alias sc="cd $HOME/dev/mskcc/smile-commons"
alias nconf="cd $HOME/.config/nvim"
alias zconf="cd $HOME/.zsh"
alias s="cd $HOME/.scripts"

# nvim
alias vi='nvim'

# nvim quick access
alias viz='cd && vi ~/.zshrc' # [vi] [z]shrc
alias vizc="cd $HOME/.zsh && vi" # [vi] [z]sh [c]onfig
alias vinc="cd $HOME/.config/nvim && vi" # [vi] [n]vim [c]onfig

# ssh
alias ssd='ssh smile@smile-dev.mskcc.org'
alias ssp='ssh smile@smile.mskcc.org'
alias sqd="ssh $USER@smile-dev.mskcc.org"
alias sqp="ssh $USER@smile.mskcc.org"

# python venv
alias venv-init='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# git
# See oh-my-zsh git plugin's aliases before adding anything here: `alias | grep git`
alias gl='git log --oneline --graph --all'

# For storing dotfiles in a bare git repository
# Source: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias c='config'
alias cst='config status'
alias cdf='config diff'
alias ca='config add'
alias crs='config restore'
alias cl='config log --oneline --graph --all'
alias ccmsg='config commit --message'
alias ccam='config commit --all --message'
alias 'ccan!'='config commit --all --no-edit --amend'
alias 'ccn!'='config commit --no-edit --amend'
alias cps='config push'
alias co='config open'

# Improved ls
alias ls='eza --icons --color=always --group-directories-first'
alias l='eza -al --icons --color=always --group-directories-first'
alias ll='eza -l --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'

# System
alias reload="exec ${SHELL} -l" # reload the shell
alias path='echo -e ${PATH//:/\\n}' # print each PATH entry on a separate line

# Other
alias nrd='npm run dev'
alias yay='curl parrot.live'
