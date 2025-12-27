#!/bin/bash

pacman -S --needed --noconfirm $(cat packages.txt)
pacman -R --noconfirm plasma-welcome drkonqi plasma-systemmonitor flatpak-kcm flatpak