#!/bin/zsh
# Function to install a package using Homebrew or Pacman
install_package() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install python poetry
  elif [[ -f "/etc/arch-release" ]]; then
    sudo pacman -S python python-poetry
  else
    echo "Error: Unsupported operating system."
    exit 1
  fi
}

echo "Installing Python..."
install_package

