#!/bin/zsh

# Ask for the administrator password upfront, and keep that access until the end
echo "Enter root password."
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

echo
echo "------------------------------------------------------------"
echo "INSTALLING HOMEBREW..."
echo "------------------------------------------------------------"
echo

# Install Homebrew
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [ ! -f ~/.zprofile ]; then
    echo "Creating ~/.zprofile file..."
    touch ~/.zprofile
  fi

  if ! grep -q "brew shellenv" ~/.zprofile; then
    echo "Adding Homebrew to PATH in ~/.zprofile..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  fi

  # Source the profile to make brew available in current session
  source ~/.zprofile
else
  echo "Homebrew already installed, skipping installation."
fi

# Exit if Homebrew fails to be installed
if ! command -v brew &> /dev/null; then
  echo "Error: Homebrew failed to be installed or found in PATH."
  exit 1
fi

echo
echo "------------------------------------------------------------"
echo "INSTALLING OH MY ZSH..."
echo "------------------------------------------------------------"
echo

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  # (The `--unattended` flag prevents the reloading of the shell after installation,
  # which would prevent the rest of the script from running)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed, skipping installation."
fi

# Install Oh My Zsh plugins
safe_git_clone() {
  local repo_url="$1"
  local target_dir="$2"
  local plugin_name

  # Extract plugin name from repo URL
  plugin_name=$(basename "$repo_url" .git)

  # Check if the target directory already exists
  if [[ -d "$target_dir" ]]; then
    echo "Warning: Directory '$target_dir' already exists. Skipping clone for $plugin_name."
    return 1
  fi

  # Create parent directories if they don't exist
  mkdir -p "$(dirname "$target_dir")"

  # Clone the repository
  if git clone "$repo_url" "$target_dir"; then
    echo "Successfully cloned $plugin_name to $target_dir"
    return 0
  else
    echo "Error: Failed to clone $plugin_name to $target_dir"
    return 1
  fi
}
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}" # set ZSH_CUSTOM if not already set
safe_git_clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
safe_git_clone "https://github.com/zsh-users/zsh-autosuggestions.git" "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
safe_git_clone "https://github.com/MichaelAquilina/zsh-you-should-use.git" "$ZSH_CUSTOM/plugins/you-should-use"
safe_git_clone "https://github.com/paulirish/git-open.git" "$ZSH_CUSTOM/plugins/git-open"

# Install Powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
  echo "Powerlevel10k theme already installed, skipping installation."
fi

echo
echo "------------------------------------------------------------"
echo "SETTING UP DOTFILES..."
echo "------------------------------------------------------------"
echo

# Define the `config` function instead of an alias so it works within the script
config() {
  git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@"
}

# Clone the remote dotfiles repo into a bare Git repo of the new machine's $HOME
# (What's a bare repo? https://craftquest.io/articles/what-is-a-bare-git-repository)
if [ ! -d "$HOME/.cfg" ]; then
  echo "Cloning dotfiles repository..."
  git clone --bare https://github.com/qu8n/dotfiles.git $HOME/.cfg
else
  echo "Dotfiles repository already exists, skipping clone. Pulling latest changes..."
  config pull
fi

# Checkout the actual content from the bare repository to the $HOME directory
# If the command above fails because there are existing files that would be
# overwritten, back them up to a temporary directory and try the checkout again.
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .config-backup
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    config checkout
fi;

# Disable the bare repo from showing untracked files
config config --local status.showUntrackedFiles no

# Symlink selected config files to the directories where their respective
# programs expect them
mkdir -p ~/.config

create_symlink() {
  local source="$1"
  local target="$2"

  if [ -L "$target" ]; then
    echo "Removing existing symlink: $target"
    rm "$target"
  elif [ -e "$target" ]; then
    echo "Backing up existing file/directory: $target"
    mv "$target" "$target.backup.$(date +%Y%m%d%H%M%S)"
  fi

  echo "Creating symlink: $source -> $target"
  ln -s "$source" "$target"
}

create_symlink ~/nvim ~/.config/nvim
create_symlink ~/karabiner ~/.config/karabiner
create_symlink ~/ghostty ~/.config/ghostty

echo
echo "------------------------------------------------------------"
echo "INSTALLING HOMEBREW PACKAGES..."
echo
echo "Prepare to enter login password for select packages."
echo "------------------------------------------------------------"
echo

# Install Rosetta 2 if on Apple Silicon
# (Some packages were built for Intel Mac, so we need Rosetta to run them on M1)
if [[ $(uname -m) == 'arm64' ]]; then
  echo "Apple Silicon detected, installing Rosetta 2..."
  # Check if Rosetta is already installed
  if ! /usr/bin/pgrep -q oahd; then
    softwareupdate --install-rosetta --agree-to-license
  else
    echo "Rosetta 2 already installed, skipping installation."
  fi
else
  echo "Intel Mac detected, skipping Rosetta 2 installation."
fi

# Install Homebrew formulaes and casks
if [ -f ~/homebrew/Brewfile ]; then
  echo "Installing Homebrew packages from Brewfile..."
  brew bundle --file ~/homebrew/Brewfile || true # ignore failures
else
  echo "Error: ~/homebrew/Brewfile not found!"
  exit 1
fi

# Install archived versions of apps
# ------------------------------------------------------------
# I've purchased the license keys for older versions of some apps. `brew install`
# downloads the binary for the latest version, which isn't covered by my license.
# Next, we need to revert to the archived versions of these apps.
#
# How to find the archived version of a cask:
# 1. Go to the main Homebrew page of the cask (e.g. https://formulae.brew.sh/cask/cleanshot)
# 2. Click on "Cask code on Github"
# 3. Click on "History"
# 4. Click on the commit name of the desired version
# 5. Click on the ellipsis (...)
# 6. Click on "View file" > "Raw"
# 7. Copy the URL, then `curl` it into ~/homebrew/archived-versions
install_archived_app() {
  local app_name="$1"
  local rb_file="$2"

  echo "Managing $app_name installation..."

  # Check if the app is installed
  if brew list "$app_name" &>/dev/null; then
    echo "Uninstalling latest version of $app_name..."
    brew uninstall --zap "$app_name"
  fi

  # Check if the archived version file exists
  if [ -f "$rb_file" ]; then
    echo "Installing archived version of $app_name..."
    brew install --HEAD -s "$rb_file"
  else
    echo "Error: Archived version file not found: $rb_file"
    return 1
  fi
}
install_archived_app "cleanshot" ~/homebrew/archived-versions/cleanshot.rb
install_archived_app "tableplus" ~/homebrew/archived-versions/tableplus.rb

# Manual installs for select apps
open /opt/homebrew/Caskroom/logitune/*/LogiTuneInstaller.app 2>/dev/null

echo
echo "------------------------------------------------------------"
echo "INSTALLING ASDF PLUGINS AND VERSIONS..."
echo "------------------------------------------------------------"
echo

# Install asdf plugins from ~/.tool-versions
# ('!/^#/ && NF { print $1 }' removes comments and empty lines)
awk '!/^#/ && NF { print $1 }' ~/.tool-versions | sort -u | xargs -I{} asdf plugin add {}

# Install asdf versions from ~/.tool-versions
asdf install

echo
echo "------------------------------------------------------------"
echo "INSTALLATION COMPLETE!"
echo "------------------------------------------------------------"
echo
