#!/bin/bash

useradd -m -G wheel $USERNAME
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
passwd
passwd $USERNAME
cp -r .local /mnt/root/home/$USERNAME/
chown -R $USERNAME:$USERNAME /mnt/root/home/$USERNAME/.local

cp -r .config /mnt/root/home/$USERNAME/
chown -R $USERNAME:$USERNAME /mnt/root/home/$USERNAME/.config
