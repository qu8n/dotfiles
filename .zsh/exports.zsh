# Work
export NEO4J_USERNAME=neo4j
export NEO4J_PASSWORD=$(pass MSKCC/Neo4j)
export NEO4J_DATA_HOME="/Users/$USER/dev/mskcc/smile-dashboard/neo4j"
export SMILE_DATA_HOME="/Users/$USER/dev/mskcc/smile-data"
export SMILE_CONFIG_HOME="/Users/$USER/dev/mskcc/smile-configuration"
export NODE_TLS_REJECT_UNAUTHORIZED=0
export NODE_OPTIONS="--max-old-space-size=16384"

# avante.nvim
export OPENAI_API_KEY=$(pass APIKey/OpenAI)
export ANTHROPIC_API_KEY=$(pass APIKey/Anthropic)
