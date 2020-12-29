#!/bin/bash
#git clone https://github.com/jdzcn/debian
#cd debian
#apt install debootstrap -y

debootstrap buster /mnt http://mirrors.tuna.tsinghua.edu.cn/debian

echo 'debian' >/mnt/etc/hostname
echo '127.0.0.1 debian.localdomain debian'>>/mnt/etc/hosts

cp root.sh /mnt/root
cp interfaces /mnt/etc/network
cd /mnt
mount --bind /dev dev
mount --bind /dev/pts dev/pts
mount --bind /proc proc
mount --bind /sys sys

chroot /mnt

#passwd
#blkid > /etc/fstab & nano /etc/fstab
#echo 'UUID=*** / ext4 defaults 0 1' >/etc/fstab
#apt install linux-image-amd64
#apt install grub-pc