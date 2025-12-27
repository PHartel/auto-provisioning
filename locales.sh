#!/bin/bash

source /root/opt/setup/config.sh

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