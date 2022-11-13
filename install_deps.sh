#!/bin/bash

install etc/modprobe.d/ec_sys.conf /etc/modprobe.d/ec_sys.conf
install etc/modules-load.d/ec_sys.conf /etc/modules-load.d/ec_sys.conf
sudo modprobe ec_sys write_support=1
yes | sudo pacman -S python-pip
yes | sudo pacman -S tk
yes | sudo pacman -S xterm
pip3 install psutil

# Uncomment this if you use GRUB.
#GRUB_CMDLINE_LINUX_DEFAULT="quiet ec_sys.write_support=1"
 
