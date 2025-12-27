#!/bin/bash
set -e

# Load configuration variables
source config.sh

timedatectl set-ntp true

# Set network configuration
bash network.sh

# Update mirrorlist
bash mirror.sh

# Partition and format disks
bash partition.sh

# Install base system
bash setup-linux.sh

chmod +x /mnt/root/opt/setup/chroot.sh
arch-chroot /mnt /root/opt/setup/chroot.sh