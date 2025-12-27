#!/bin/bash

pacman -S --needed --noconfirm $(cat /root/opt/setup/packages.txt)
pacman -R --noconfirm plasma-welcome drkonqi plasma-systemmonitor flatpak-kcm flatpak