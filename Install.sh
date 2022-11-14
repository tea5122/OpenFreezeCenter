#!/bin/bash
install etc/modprobe.d/ec_sys.conf /etc/modprobe.d/ec_sys.conf
install etc/modules-load.d/ec_sys.conf /etc/modules-load.d/ec_sys.conf
sudo modprobe ec_sys write_support=1

path_python3=$(which python3)
user=$(whoami)
line="$user ALL=(root) NOPASSWD:$path_python3"
file='/etc/sudoers'
line_num=$(sudo awk '/%sudo/{print NR}' $file)
line_num=`expr $line_num + 1` 
sudo sed -i "$line_num i $line" $file

path_nohup=$(which nohup)
line_="$user ALL=(root) NOPASSWD:$path_nohup"
file_='/etc/sudoers'
line_num_=$(sudo awk '/%sudo/{print NR}' $file_)
line_num_=`expr $line_num_ + 1` 
sudo sed -i "$line_num_ i $line_" $file_

packages=python-pip tk xterm
if pacman -Qs $packages > /dev/null ; then
  pacman -S python-pip tk xterm
fi

if python -c 'import pkgutil; exit(not pkgutil.find_loader("psutil"))'; then
    echo ' "psutil" found, No need to install.'
else
    echo '"psutil" Is being installed.'
    pip3 install psutil
fi

# Uncomment this if you use GRUB and want to load the modules at boot.
#GRUB_CMDLINE_LINUX_DEFAULT="quiet ec_sys.write_support=1"
 
