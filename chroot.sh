#!/bin/bash
source /root/config.sh

ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
hwclock --systohc

sed -i "s/#$LOCALE/$LOCALE/" /etc/locale.gen
locale-gen
echo "LANG=$LOCALE" > /etc/locale.conf

echo "$HOSTNAME" > /etc/hostname

pacman -S --noconfirm $(cat /root/packages.txt)

useradd -m -G wheel $USERNAME
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

systemctl enable NetworkManager

bootctl install