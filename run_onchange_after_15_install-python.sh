#!/bin/zsh

# Function to install a package using Homebrew or Pacman
install_package() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install $1
  elif [[ -f "/etc/arch-release" ]]; then
    # Use 'python-poetry' for Arch Linux
    local package_name=$1
    if [ "$package_name" == "poetry" ]; then
      package_name="python-poetry"
    fi
    sudo pacman -S $package_name
  else
    echo "Error: Unsupported operating system."
    exit 1
  fi
}

# Check if Pyenv is installed and install it if not
if ! command -v pyenv >/dev/null 2>&1; then
  echo "Installing Pyenv..."
  install_package pyenv
fi

# Install Python and set it as the global default
echo "Installing Python..."
pyenv install 3.11.2  # Replace with your desired Python version
pyenv global 3.11.2
source ~/.zshrc

# Install Poetry
echo "Installing Poetry..."
install_package poetry

echo "Pyenv, Python, and Poetry installation completed!"

