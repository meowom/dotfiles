#!/bin/zsh
# Check the operating system
echo "Installing Pyenv..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  brew install pyenv
elif [[ -f "/etc/arch-release" ]]; then
  # Arch Linux
  sudo pacman -S pyenv
else
  echo "Error: Unsupported operating system."
  exit 1
fi
# Set up shell environment for Pyenv
echo 'test'
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc

echo "Installing Python..."
pyenv install 3.9.6  # Replace with your desired Python version
pyenv global 3.9.6    # Set the installed Python version as the global default
echo "Pyenv and Python installation completed!"

