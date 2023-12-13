#!/bin/zsh

# Function to download rustup-init.sh and install Rust
install_rust() {
    echo "Downloading rustup-init.sh..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.sh

    echo "Installing Rust..."
    sh rustup-init.sh -y

    # Source the cargo environment (this assumes the default installation path)
    source $HOME/.cargo/env
}

# Check if Rust is already installed
# if command -v rustc > /dev/null; then
#     echo "Rust is already installed."
#     exit 0
# fi

install_rust
