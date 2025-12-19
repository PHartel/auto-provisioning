#!/bin/bash
source config.sh

fdisk "$DISK" <<EOF
g
n
1

+512M
t
1
n
2


w
EOF

sleep 2

mkfs.fat -F32 ${DISK}1
mkfs.ext4 -F ${DISK}2

mount ${DISK}2 /mnt
mkdir -p /mnt/boot
mount ${DISK}1 /mnt/boot

echo "Partitioning complete:"
lsblk