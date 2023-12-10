#!/bin/zsh

# Common software packages for both macOS and Arch Linux
common_packages=(
    # Development and Reverse Engineering Tools
    "radare2"       # Advanced command line hexadecimal editor and reverse engineering tool

    # Disk Management and Analysis
    "dust"          # Disk usage analyzer with a more intuitive output than 'du'
    "duf"           # Disk Usage/Free Utility - a better 'df' alternative
    "tree"          # Recursive directory listing command that produces a depth-indented listing

    # File Searching and Navigation
    "fd"            # Simple, fast and user-friendly alternative to 'find'
    "ripgrep"       # Recursively searches directories for a regex pattern
    "fzf"           # General-purpose command-line fuzzy finder
    "lsd"           # The next gen ls command with a lot of pretty colors and awesome icons

    # Text Editors
    "neovim"        # Hyperextensible Vim-based text editor

    # System and Performance Monitoring
    "bottom"        # Graphical process/system monitor with a customizable interface
    "neofetch"      # Fast, highly customizable system info script
    "procs"         # A modern replacement for ps written in Rust

    # Terminal Productivity and Utilities
    "tealdeer"      # Very fast implementation of 'tldr' (simplified, community-driven man pages)
    "zellij"        # Terminal workspace with features like panes and tabs

    # Version Control
    "git"           # Distributed version control system for tracking changes in source code
    "lazygit"       # Simple terminal UI for git commands
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
  brew install gh
	brew install --cask alacritty
  brew autoremove
elif [[ -f "/etc/arch-release" ]]; then
	# Arch Linux: Installation using Pacman
	install_pacman_packages ${common_packages[@]}
  sudo pacman -Syu github-cli base-devel man-db man-pages
else
	# Unsupported Operating System
	echo "Error: Unsupported operating system."
	exit 1
fi
