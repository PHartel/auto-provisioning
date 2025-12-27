#!/bin/bash

useradd -m -G wheel $USERNAME
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
passwd
passwd $USERNAME
cp -r .local /root/home/$USERNAME/
chown -R $USERNAME:$USERNAME /root/home/$USERNAME/.local

cp -r .config /root/home/$USERNAME/
chown -R $USERNAME:$USERNAME /root/home/$USERNAME/.config
