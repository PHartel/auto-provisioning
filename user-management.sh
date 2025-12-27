#!/bin/bash

source /root/opt/setup/config.sh

useradd -m -G wheel $USERNAME
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
passwd
passwd $USERNAME
cp -r /root/opt/setup /root/home/$USERNAME/
chown -R $USERNAME:$USERNAME /root/home/$USERNAME/.local

chown -R $USERNAME:$USERNAME /root/home/$USERNAME/.config
