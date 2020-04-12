#!/usr/bin/env bash

DOTFILES_DIR="${HOME}/.dotfiles"
directories=("runcom" "config/git" "config/vim" "config/tmux" "config/ctags")

for dir in ${directories[@]}; do
  for dotfile in "$DOTFILES_DIR/$dir"/.*; do
    if [ -f "$dotfile" ]; then
      basename=$(basename $dotfile)

      if [ -f "$HOME/$basename" ]; then
        mv "$HOME/$basename" "$HOME/$basename.backup"
      fi

      ln -sv "$dotfile" ~
    fi

  done
done

source ~/.bash_profile;
