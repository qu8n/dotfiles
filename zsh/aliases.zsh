# Aliases set here override those provided by Oh My Zsh libs, plugins, and themes

alias zource='source ~/.zshrc'

# Personal directories
alias sd="cd $HOME/dev/mskcc/smile-dashboard"
alias ss="cd $HOME/dev/mskcc/smile-server"
alias srf="cd $HOME/dev/mskcc/smile-request-filter"
alias smp="cd $HOME/dev/mskcc/smile-message-publisher"
alias sconf="cd $HOME/dev/mskcc/smile-configuration"
alias su="cd $HOME/dev/mskcc/smile-utils"
alias sc="cd $HOME/dev/mskcc/smile-commons"
alias nconf="cd $HOME/.config/nvim"
alias zconf="cd $HOME/zsh"
alias s="cd $HOME/scripts"

# NeoVim
alias vi='nvim'
alias viz='cd && vi ~/.zshrc' # [vi] [z]shrc
alias vizc="cd $HOME/zsh && vi" # [vi] [z]sh [c]onfig
alias vinc="cd $HOME/.config/nvim && vi" # [vi] [n]vim [c]onfig

# ssh
function ssh_with_pass() {
  local user=$1
  local host=$2

  SSHPASS=$(pass MSKCC/${user}) || { echo "Failed to retrieve password from pass"; return 1; }
  export SSHPASS
  sshpass -e ssh ${user}@${host} # sshpass by default reads the password from SSHPASS
  unset SSHPASS
}
alias ssd='ssh_with_pass smile smile-dev.mskcc.org'
alias ssp='ssh_with_pass smile smile.mskcc.org'
alias sqd='ssh_with_pass ${USER} smile-dev.mskcc.org'
alias sqp='ssh_with_pass ${USER} smile.mskcc.org'

# python venv
alias vinit='python3 -m venv .venv'
alias activate='source .venv/bin/activate'

# Git
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

# Better ls
alias ls='eza --icons --color=always --group-directories-first'
alias l='eza -al --icons --color=always --group-directories-first'
alias ll='eza -l --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'

# History
alias h='history'
alias hg='history | grep'
alias hgi='history | grep -i'

# Miscellaneous
alias yay='curl parrot.live'
alias reload="exec ${SHELL} -l" # reload the shell, including login shell
alias path='echo -e ${PATH//:/\\n}' # pretty print the PATH variables
alias tp='trash-put' # safer rm, from andreafrancia/trash-cli
alias nrd='npm run dev'
alias cmx='chmod +x'
