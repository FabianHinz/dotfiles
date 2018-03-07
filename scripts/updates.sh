#!/bin/sh

# Display the number of available updates in pacman and the AUR

if [ $BLOCK_BUTTON = "3" ]; then
  $TERMINAL --name="update_installer" -e "trizen -Syu"
fi

pac=$(checkupdates | wc -l)
if ! aur=$(trizen -Su --aur --quiet | wc -l); then
  aur=0
fi

updates=$((pac + aur))
if [ "$updates" -gt 0 ]; then
  echo " ($pac;$aur)"
else
  echo ""
fi
