#!/bin/zsh
# Check the operating system
echo "Install Python..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install python poetry
elif [[ -f "/etc/arch-release" ]]; then
  # Arch Linux
  sudo pacman -S python-poetry
else
  echo "Error: Unsupported operating system."
  exit 1
fi

source ~/.zshrc

echo "Python installation completed!"
