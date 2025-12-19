#!/bin/bash
source /root/config.sh
touch /etc/vconsole.conf
mkinitcpio -P

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

cat <<EOF > /boot/loader/entries/arch.conf
title   Arch Linux
linux   /vmlinuz-linux
initrd  /initramfs-linux.img
options root=${DISK}2 rw
EOF

cat <<EOF > /boot/loader/loader.conf
default arch
timeout 3
editor  0
EOF

echo "=== Installation complete ==="