#!/usr/bin/env bash
set -e

echo "👉 Installing Zsh if missing..."
if ! command -v zsh >/dev/null; then
  if [ -f /etc/debian_version ]; then
    sudo apt update && sudo apt install -y zsh git curl
  elif [ -f /etc/arch-release ]; then
    sudo pacman -Sy --noconfirm zsh git curl
  else
    echo "Unsupported distro—please install zsh, git, curl manually." >&2
    exit 1
  fi
else
  echo "✅ Zsh already installed."
fi

echo "🔧 Setting Zsh as default shell..."
chsh -s "$(command -v zsh)" || echo "⚠️ Could not change shell—maybe do manually."

echo "📦 Installing Oh My Zsh..."
RUNZSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "🎨 Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "🔌 Installing plugins: autosuggestions & syntax-highlighting..."
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

echo "📝 Generating new ~/.zshrc..."
cat > ~/.zshrc <<'EOF'
# Instant prompt for Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"
EOF

echo "✅ Installation complete!"
echo "Now restart your terminal or run: exec zsh"
echo "Then run: p10k configure  🔧 to pick your prompt style."
