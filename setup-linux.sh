#!/bin/bash
source config.sh

loadkeys $KEYMAP
setfont $FONT

pacstrap /mnt base linux linux-firmware sudo git networkmanager
genfstab -U /mnt >> /mnt/etc/fstab

# Copy all in /opt/setup to the new system and create folder if not exists
mkdir -p /mnt/root/opt/setup
cp -r ./ /mnt/root/opt/setup

echo "Base system installation complete."
