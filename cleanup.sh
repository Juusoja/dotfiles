#!/bin/bash
if [ -z "$HOME" ]; then
    echo "Home directory not detected."
    exit 1
fi

BACKUP = $HOME/dotfiles_backup/

mkdir $HOME/.dotfiles_backup
mv $HOME/.bashrc $BACKUP
mv $HOME/.vimrc $BACKUP
mv $HOME/.gitconfig $BACKUP
mv $HOME/.i3 $BACKUP
