#!/bin/bash
source config.sh

loadkeys $KEYMAP
setfont $FONT

pacstrap /mnt base linux linux-firmware sudo git networkmanager
genfstab -U /mnt >> /mnt/etc/fstab

cp chroot.sh /mnt/root/
cp config.sh /mnt/root/
cp packages.txt /mnt/root/
