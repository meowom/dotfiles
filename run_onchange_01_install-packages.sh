#!/bin/zsh

# Common packages for searching, finding, and replacing text
search_packages="ripgrep fd sd"

# Terminal enhancement packages
terminal_packages="gitui bottom bat broot zellij"

# Productivity tools
productivity_packages="neovim chezmoi tealdeer"

# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install $search_packages $terminal_packages $productivity_packages
  brew install gh
  # To access, find it in Finder, right-click, and select "Open"
  brew install --cask alacritty
elif [[ -f "/etc/arch-release" ]]; then
  # Arch Linux
  sudo pacman -Syu $search_packages $terminal_packages $productivity_packages 
  sudo pacman -Syu github-cli git man-db man-pages base-devel
else
  echo "Error: Unsupported operating system."
  exit 1
fi

