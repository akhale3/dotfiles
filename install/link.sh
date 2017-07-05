#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

printf "\nCreating symlinks\n"
printf "================================\n"
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        printf "~${target#$HOME} already exists. Skipping.\n"
    else
        printf "Creating symlink for $file\n"
        ln -s $file $target
    fi
done
