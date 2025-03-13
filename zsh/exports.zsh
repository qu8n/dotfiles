# System
export EDITOR=nvim

# avante.nvim
export OPENAI_API_KEY=$(pass APIKey/OpenAI)
export ANTHROPIC_API_KEY=$(pass APIKey/Anthropic)

# eza
export LS_COLORS="" # reset colors set by oh-my-zsh
export EZA_CONFIG_DIR="$HOME/eza"
export EZA_COLORS="uu=2:gu=2" # dim the user/group columns
