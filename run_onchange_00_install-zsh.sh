#!/bin/bash

# Check if the operating system is macOS or Arch Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
	OS="macos"
elif [[ -f "/etc/arch-release" ]]; then
	OS="arch"
else
	echo "Unsupported operating system. This script only supports macOS and Arch Linux."
	exit 1
fi

# Check if Zsh is installed
if [[ -n "$(command -v zsh)" ]]; then
	echo "Zsh is already installed."
else
	# Install Zsh based on the detected operating system
	if [[ "$OS" == "macos" ]]; then
		brew install zsh
	elif [[ "$OS" == "arch" ]]; then
		sudo pacman -S zsh
	fi
fi

# Set Zsh as the default shell
if [[ "$SHELL" != "/bin/zsh" ]]; then
	# Add Zsh to the list of allowed shells
	if [[ "$OS" == "macos" ]]; then
		sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
	elif [[ "$OS" == "arch" ]]; then
		sudo sh -c 'echo "/bin/zsh" >> /etc/shells'
	fi

	# Change the default shell for the current user
	chsh -s "$(command -v zsh)"
	echo "Zsh is now set as the default shell. Please log out and log back in to apply the changes."
else
	echo "Zsh is already the default shell."
fi
