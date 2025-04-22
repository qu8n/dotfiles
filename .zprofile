# Execute variables for Homebrew to work properly
eval "$(/opt/homebrew/bin/brew shellenv)"

# Start gpg-agent
gpgconf --launch gpg-agent
