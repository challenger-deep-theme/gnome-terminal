#!/usr/bin/env bash

# Execute script relative to folder where color pallet exists
DIR=${BASH_SOURCE%/*}/

# Color pallet config file
FILE=$DIR"challenger-deep.dconf"

# dconf path for gnome-terminal
TERM_CONFIG="/org/gnome/terminal/legacy/"

# dconf path for default gnome-terminal profile
PROFILE=$TERM_CONFIG"profiles:/default"

# Updates target profile in config file
function update_config {
  REPLACE="[profiles:/:$1]"
  REPLACE=$(echo $REPLACE | tr -d \'\")
  sed -i "1c$REPLACE" $FILE
}

# Find default terminal profile
ID=$(dconf read $PROFILE)

# Set file to use profile
update_config $ID

# Load color pallet into terminal profile
dconf load $TERM_CONFIG < $FILE

# Reset config file
update_config "'ID'"
