#!/bin/bash
#apt install debootstrap -y

debootstrap buster /mnt http://mirrors.tuna.tsinghua.edu.cn/debian

echo 'debian' >/mnt/etc/hostname
echo '127.0.0.1 debian.localdomain debian'>>/mnt/etc/hosts


cd /mnt
mount --bind /dev dev
mount --bind /dev/pts dev/pts
mount --bind /proc proc
mount --bind /sys sys

chroot /mnt

#passwd
#echo 'UUID=*** / ext4 defaults 0 1' >/mnt/etc/fstab
#apt install linux-image-amd64
#apt install grub-pc