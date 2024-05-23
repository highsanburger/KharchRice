#!/usr/bin/env bash

sudo pacman --noconfirm -S neofetch git

git clone https://github.com/highsanburger/KharchRice

cd KharchRice

mv .config ..

neofetch
