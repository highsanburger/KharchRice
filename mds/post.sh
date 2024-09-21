#!/usr/bin/env bash
#
# TODO
# fonts
# LSPs whiptail

# sudo pacman --noconfirm -S neofetch git
# read progs.csv and install everything

git clone https://github.com/highsanburger/KharchRice

cd KharchRice || exit 1

mv .config ..

neofetch
