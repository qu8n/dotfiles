# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

export GPG_TTY=$TTY # fix GPG singing issues caused by p10k

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # Highlight commands in the CLI
  zsh-syntax-highlighting
  # Suggest commands based on history in grey text, press <right arrow> to accept
  zsh-autosuggestions
  # Remind user to use available aliases when typing out full commands
  you-should-use
  # Add `git open` command to open the GitHub page of the current repo
  git-open
  # Add extra git aliases
  git
)

# Make OMZ save zcompdump files inside $ZSH instead of littering $HOME
# Source: https://stackoverflow.com/a/71271754
# (These are caches for zsh completion system to make completions faster)
export ZSH_COMPDUMP=$ZSH/cache/.zcompdumps

source $ZSH/oh-my-zsh.sh # oh-my-zsh startup script
source ~/.p10k.zsh # p10k configs
