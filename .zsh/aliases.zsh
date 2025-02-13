# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# Personal directories
alias sd="cd /Users/$USER/dev/mskcc/smile-dashboard"
alias ss="cd /Users/$USER/dev/mskcc/smile-server"
alias srf="cd /Users/$USER/dev/mskcc/smile-request-filter"
alias smp="cd /Users/$USER/dev/mskcc/smile-message-publisher"
alias sconf="cd /Users/$USER/dev/mskcc/smile-configuration"
alias su="cd /Users/$USER/dev/mskcc/smile-utils"
alias sc="cd /Users/$USER/dev/mskcc/smile-commons"
alias nconf="cd /Users/$USER/.config/nvim"
alias zconf="cd /Users/$USER/.zsh"

# nvim
alias vi='nvim'

# ssh shortcuts
alias ssd='ssh smile@smile-dev.mskcc.org'
alias ssp='ssh smile@smile.mskcc.org'
alias sqd="ssh $USER@smile-dev.mskcc.org"
alias sqp="ssh $USER@smile.mskcc.org"

# venv
alias venv-init='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# git (See the aliases added by oh-my-zsh first before adding anything here)
alias gl='git log --oneline --graph --all'
alias go='git open' # command added by the git-open oh-my-zsh plugin

# For storing dotfiles in a bare git repository
# Source: https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias c='config'
alias cst='config status'
alias cdf='config diff'
alias ca='config add'
alias cl='config log --oneline --graph --all'
alias ccm='config commit --message'
alias ccam='config commit --all --message'
alias 'ccan!'='config commit --all --no-edit --amend'
alias 'ccn!'='config commit --no-edit --amend'
alias cp='config push'

# Other
alias nrd='npm run dev'
alias yay='curl parrot.live'
