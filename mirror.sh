#!/bin/bash

pacman -Sy --noconfirm reflector
reflector --country Germany --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
