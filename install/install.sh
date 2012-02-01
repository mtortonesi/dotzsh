#!/bin/sh

if [ -d ~/.zsh.d ] || [ -f ~/.zshrc ] || [ -h ~/.zshrc ] || [ -f ~/.zshenv ] || [ -h ~/.zshenv ]
then
  echo "\033[0;33mYou already have a Zsh configuration installed...\033[0m"
  BACKUP_DIR="$HOME/zsh-config-backup-$(date +%Y%m%d%H%M)"
  if ! mkdir $BACKUP_DIR; then
      echo "\033[0;33mBackup failed! (Backup directory $BACKUP_DIR already existing?) Exiting... :-(\033[0m"
      exit 1
  fi
  mv ~/.zsh.d  $BACKUP_DIR
  mv ~/.zshenv $BACKUP_DIR
  mv ~/.zshrc  $BACKUP_DIR
fi

echo "\033[0;34mCloning Zsh configuration...\033[0m"
/usr/bin/env git clone https://github.com/mtortonesi/dotzsh.git ~/dotzsh

echo "\033[0;34mCreating symlinks...\033[0m"
ln -s ~/dotzsh/.zsh.d  .zsh.d
ln -s ~/dotzsh/.zshenv .zshenv
ln -s ~/dotzsh/.zshrc  .zshrc

echo "\033[0;34mChanging default shell to Zsh (will require password)...\033[0m"
chsh -s `which zsh`

echo "\n \033[0;32mConfiguration installed. Remember to set your PATH in ~/.zsh.d/10_exports.zsh.\033[0m"

echo "\n \033[0;32mStarting Zsh.\033[0m"
/usr/bin/env zsh
