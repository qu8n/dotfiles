# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Required after installing asdf with brew
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Set JAVA_HOME using asdf
. ~/.asdf/plugins/java/set-java-home.zsh
