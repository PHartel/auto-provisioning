#!/bin/bash
source /root/config.sh
touch /etc/vconsole.conf
mkinitcpio -P

ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
hwclock --systohc

cat <<EOF > /etc/vconsole.conf
KEYMAP=$KEYMAP
FONT=$FONT
EOF


sed -i "s/#$LOCALE/$LOCALE/" /etc/locale.gen
locale-gen
echo "LANG=$LOCALE" > /etc/locale.conf

echo "$HOSTNAME" > /etc/hostname

pacman -S --noconfirm $(cat /root/packages.txt)

useradd -m -G wheel $USERNAME
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
passwd
passwd $USERNAME

systemctl enable NetworkManager
nmcli con add type ethernet ifname $NET_IFACE con-name static-enp3s0 \
  ipv4.method manual \
  ipv4.addresses 192.168.100.7/24 \
  ipv4.gateway 192.168.100.1 \
  ipv4.dns 1.1.1.1,8.8.8.8
systemctl enable sddm
mkdir -p /etc/sddm.conf.d
cat <<EOF > /etc/sddm.conf.d/10-wayland.conf
[General]
DisplayServer=wayland
EOF

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