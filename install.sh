#!/usr/bin/env bash

# Include helper functions for shell beautification
source ./lib/echoes.sh

# Define custom functions
command_exists() {
    type "$1" > /dev/null 2>&1
}

cat << "EOF"
     _       _    __ _ _
    | |     | |  / _(_) |
  __| | ___ | |_| |_ _| | ___  ___
 / _` |/ _ \| __|  _| | |/ _ \/ __|
| (_| | (_) | |_| | | | |  __/\__ \
 \__,_|\___/ \__|_| |_|_|\___||___/

                      - Anish Khale
EOF

running "Installing dotfiles"

# Create symlinks for dotfiles
source install/link.sh

# macOS-specific installation
if [ "$(uname)" == "Darwin" ]; then
    action "Installing macOS-specific files"

    source install/brew.sh
    source install/macOS.sh

    ok
fi

# Set ZSH as default shell
action "Setting ZSH as default shell"

if ! command_exists zsh; then
    error "zsh not found. Please install and then re-run the installation script."
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    chsh -s $(which zsh)
    ok
else
    # Current shell is ZSH. Nothing to do here.
    ok
fi

# Install global node modules
action "Installing global node modules"

if ! command_exists npm; then
    error "npm not found. Please install and re-run the installation script."
    exit 1
else
    npm install -g
    ok
fi

bot "Configuration complete. Please reload your terminal."
