#!/bin/zsh

echo "Installing nvm..."

# Download and install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Reload Zsh configuration to make nvm available
source ~/.zshrc

# Install the latest stable version of Node.js
echo "Installing the latest stable version of Node.js..."
nvm install node

# Use the installed Node.js version for the current shell session
echo "Using Node.js..."
nvm use node

echo "Node.js installation and setup completed successfully!"

