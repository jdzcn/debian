#!/bin/bash
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo 'exec openbox-session'>>~/.xinitrc

sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp true

git clone https://github.com/jdzcn/debian

mkdir -p ~/.config
cp -r ~/debian/openbox ~/.config

sudo cp ~/debian/trojan-client-config.json /etc/trojan/config.json
#sudo nano /etc/trojan/config.json
sudo systemctl start trojan
sudo systemctl enable trojan


startx