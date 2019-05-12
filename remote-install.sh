#!/usr/bin/env bash

# Temp work directory
FOLDER=challenger-deep
FULL=~/.config/$FOLDER

# Git remote
REMOTE=https://github.com/challenger-deep-theme/gnome-terminal

# Remove temp folder
function clean {
  rm -rf $FULL > /dev/null
}


# Install
clean
git clone $REMOTE $FULL
$FULL/install.sh
echo "Removing files"
clean
echo "Challenger Deep theme loaded"
