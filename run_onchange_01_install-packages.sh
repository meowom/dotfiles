#!/bin/zsh
# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install ripgrep fd sd
  brew install lazygit bottom zellij dust
  brew install neovim chezmoi tealdeer tree
  brew install gh
  brew install --cask alacritty
elif [[ -f "/etc/arch-release" ]]; then
  # Arch Linux
  sudo pacman -Syu ripgrep fd sd
  sudo pacman -Syu lazygit bottom zellij dust
  sudo pacman -Syu neovim chezmoi tealdeer tree
  sudo pacman -Syu github-cli git man-db man-pages base-devel
else
  echo "Error:  operating system."
  exit 1
fi

