# System
export EDITOR=nvim

# Personal variables
export NEO4J_USERNAME=neo4j
export NEO4J_PASSWORD=$(pass MSKCC/Neo4j)
export NEO4J_DATA_HOME="$HOME/dev/mskcc/smile-dashboard/neo4j"
export SMILE_DATA_HOME="$HOME/dev/mskcc/smile-data"
export SMILE_CONFIG_HOME="$HOME/dev/mskcc/smile-configuration"
export NODE_TLS_REJECT_UNAUTHORIZED=0
export NODE_OPTIONS="--max-old-space-size=16384"

# avante.nvim
export OPENAI_API_KEY=$(pass APIKey/OpenAI)
export ANTHROPIC_API_KEY=$(pass APIKey/Anthropic)

# eza
export LS_COLORS="" # reset colors set by oh-my-zsh
export EZA_CONFIG_DIR="$HOME/eza"
export EZA_COLORS="uu=2:gu=2" # dim the user/group columns
