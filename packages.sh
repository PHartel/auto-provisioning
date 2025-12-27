#!/bin/bash

source /root/opt/setup/config.sh

pacman -S --needed --noconfirm $(cat /root/opt/setup/packages.txt)
pacman -R --noconfirm plasma-welcome drkonqi plasma-systemmonitor flatpak-kcm flatpak