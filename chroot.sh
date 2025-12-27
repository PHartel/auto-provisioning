#!/bin/bash
source /root/opt/setup/config.sh

bash /root/opt/setup/locales.sh

echo "$HOSTNAME" > /etc/hostname

bash /root/opt/setup/packages.sh

bash /root/opt/setup/user-management.sh

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