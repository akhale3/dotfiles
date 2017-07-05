#!/bin/sh

if test ! $(which brew); then
    printf "Installing homebrew\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf "\nInstalling homebrew packages\n"
printf "================================\n"

formulae=(
    # flags should pass through the `brew list check`
    'macvim --with-override-system-vim'
    curl
    diff-so-fancy
    fzf
    git
    'grep --with-default-names'
    htop-osx
    markdown
    mcrypt
    openssl
    php55
    php55-mcrypt
    rbenv
    reattach-to-user-namespace
    tmux
    tree
    wget
    z
    zsh
)

for formula in "${formulae[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        printf "$formula already installed. Skipping.\n"
    else
        brew install $formula
    fi
done
