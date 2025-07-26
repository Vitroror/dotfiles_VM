#!/usr/bin/env bash

# Automated setup for Zsh, Oh My Zsh, and Powerlevel10k on Fedora Workstation 42
# Usage: chmod +x setup_shell.sh && ./setup_shell.sh

set -euo pipefail

# Variables\NDNF_CMD="sudo dnf"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# 1. Install dependencies
echo "Installing dependencies: zsh, git, curl..."
sudo dnf install -y zsh git curl

# 2. Set Zsh as default shell
if [ "$(basename "$SHELL")" != "zsh" ]; then
  echo "Changing default shell to zsh for user $USER"
  chsh -s "$(which zsh)" "$USER"
fi

# 3. Install Oh My Zsh (unattended)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
else
  echo "Oh My Zsh already installed, skipping..."
fi

# 4. Install Powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "Cloning Powerlevel10k into $ZSH_CUSTOM/themes..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "Powerlevel10k already present, skipping clone..."
fi

# 5. Configure .zshrc to use Powerlevel10k
ZSHRC="$HOME/.zshrc"
echo "Configuring \$ZSHRC to use Powerlevel10k theme..."

if grep -q "^ZSH_THEME=" "$ZSHRC"; then
  sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' "$ZSHRC"
else
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$ZSHRC"
fi

# 6. Prompt user to restart shell
echo
echo "Installation complete!"
echo "Please close and reopen your terminal, or run 'exec zsh' to start using Zsh with Powerlevel10k."
