#!/bin/zsh
# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install neovim zellij chezmoi gh tealdeer gitui dust ripgrep bottom fd sd lsd zoxide 
  # Show in Finder -> Right click -> Open
  brew install --cask alacritty
elif [[ -f "/etc/arch-release" ]]; then
  # Arch Linux
  sudo pacman -Syu zellij neovim chezmoi git github-cli man-db man-pages base-devel 
else
  echo "Error: Unsupported operating system."
  exit 1
fi

