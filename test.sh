#!/bin/zsh

# Common software packages for both macOS and Arch Linux
common_packages=(
	"ranger" "trash" "dust" "tree" "fd" # File Management and Exploration
	"sd" "neovim"                       # File Operations and Editing
	"git" "gh" "lazygit" "chezmoi"      # Version Control
	"bottom" "neofetch"                 # System and Performance Monitoring
	"zellij" "tealdeer" "ripgrep"       # Terminal Enhancements, Utilities, and Search Tools
)

# Function to install packages using Homebrew
install_brew_packages() {
	brew install $@
}

# Function to install packages using Pacman
install_pacman_packages() {
	sudo pacman -Syu $@
}

# Check the operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
	# macOS: Installation using Homebrew
	install_brew_packages ${common_packages[@]}
	# GUI (specific to macOS)
	brew install --cask alacritty
elif [[ -f "/etc/arch-release" ]]; then
	# Arch Linux: Installation using Pacman
	install_pacman_packages ${common_packages[@]}
else
	# Unsupported Operating System
	echo "Error: Unsupported operating system."
	exit 1
fi
