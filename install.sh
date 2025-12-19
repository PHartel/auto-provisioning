#!/bin/bash
set -e

source config.sh

timedatectl set-ntp true
bash network.sh
bash mirror.sh
bash partition.sh
bash base.sh
chmod +x /mnt/root/chroot.sh
arch-chroot /mnt /root/chroot.sh
