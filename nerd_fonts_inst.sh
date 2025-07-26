#!/usr/bin/env bash

# Automated “all‐fonts” installer for Nerd Fonts on Fedora 42
# Usage: chmod +x install_nerd_fonts.sh && ./install_nerd_fonts.sh

set -euo pipefail

# 1. Install prerequisites
echo "Installing dependencies (git, fontconfig)..."
sudo dnf install -y git fontconfig

# 2. Clone the Nerd Fonts repo (shallow)
REPO="https://github.com/ryanoasis/nerd-fonts.git"
CLONE_DIR="$HOME/nerd-fonts"

if [ ! -d "$CLONE_DIR" ]; then
  echo "Cloning Nerd Fonts (depth=1)..."
  git clone --depth 1 "$REPO" "$CLONE_DIR"      # Option 7: Install Script :contentReference[oaicite:0]{index=0}
else
  echo "Nerd Fonts directory exists, pulling latest..."
  git -C "$CLONE_DIR" pull
fi

# 3. Run the installer to deploy *all* patched fonts
echo "Installing ALL Nerd Fonts (this may take a while)..."
cd "$CLONE_DIR"
./install.sh                                   # installs every patched font :contentReference[oaicite:1]{index=1}

# 4. Clean up
echo "Removing temporary repo clone..."
cd "$HOME"
rm -rf "$CLONE_DIR"

# 5. Rebuild the font cache
echo "Refreshing font cache..."
fc-cache -fv

echo
echo "🎉 All Nerd‑Fonts are now installed! You can verify by checking ~/.local/share/fonts and running 'fc-list | grep Nerd'."
