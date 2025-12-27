#!/bin/bash

source /root/opt/setup/config.sh

useradd -m -G wheel $USERNAME
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
passwd
passwd $USERNAME

# Copy without that the path is /root/home/username/.local and not /root/home/username/setup/.local
cp -r /root/opt/setup/.local /root/home/$USERNAME/
chown -R $USERNAME:$USERNAME /root/home/$USERNAME/.local
cp -r /root/opt/setup/.config /root/home/$USERNAME/
chown -R $USERNAME:$USERNAME /root/home/$USERNAME/.config
