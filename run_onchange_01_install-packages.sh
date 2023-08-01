#!/bin/zsh
# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install neovim zellij chezmoi gh tree htop
elif [[ -f "/etc/arch-release" ]]; then
  # Arch Linux
  sudo pacman -Syu zellij neovim chezmoi git github-cli man-db man-pages base-devel tree htop
else
  echo "Error: Unsupported operating system."
  exit 1
fi

