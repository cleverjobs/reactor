#!/usr/bin/env bash
set -euo pipefail

# Install frontend and backend dependencies
(cd src/frontend && pnpm install)
poetry install --no-root

# Install Zsh and Oh My Zsh
if ! command -v zsh >/dev/null 2>&1; then
  apt-get update && apt-get install -y zsh
fi
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  export RUNZSH=no
  export CHSH=no
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Starship prompt
if ! command -v starship >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/starship/starship/master/install/install.sh | sh -s -- --yes
fi

# Configure Starship
mkdir -p "$HOME/.config"
cp -f .devcontainer/starship.toml "$HOME/.config/starship.toml"
if ! grep -q 'starship init zsh' "$HOME/.zshrc" 2>/dev/null; then
  echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
fi
