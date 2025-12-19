#!/bin/bash
set -e

source config.sh

timedatectl set-ntp true
bash network.sh
bash mirrors.sh
bash partition.sh
bash base.sh

arch-chroot /mnt /root/chroot.sh
