#!/bin/zsh

# Function to check if a file exists
file_exists() {
  [[ -e "$1" ]]
}

# Function to clone or pull the repository
clone_or_pull_repository() {
  if [[ -n "$CHEZMOI_PRIVATE_SETUP_REPO" ]]; then
    if file_exists .private-setup; then
      cd .private-setup
      git pull
    else
      git clone "$CHEZMOI_PRIVATE_SETUP_REPO" .private-setup
    fi
  else
    echo "Warning: \$CHEZMOI_PRIVATE_SETUP_REPO is not set or empty."
    exit 0
  fi
}

# Check if .private-setup exists, and if not, clone the repository
if ! file_exists .private-setup; then
  clone_or_pull_repository
fi

# Run .private-setup/init.zsh if it exists
if file_exists .private-setup/init.zsh; then
  source .private-setup/init.zsh
else
  echo "Error: .private-setup/init.zsh not found."
  exit 1
fi

