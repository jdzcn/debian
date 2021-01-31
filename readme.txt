Install debian 10 by debootstrap

sudo -i
fdisk -l
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

debootstrap buster /mnt http://mirrors.tuna.tsinghua.edu.cn/debian

cp /etc/network/interfaces /mnt/etc/network
blkid > /mnt/etc/fstab
#echo 'UUID=*** / ext4 defaults 0 1' >/mnt/etc/fstab

cd /mnt
mount --bind /dev dev
mount --bind /dev/pts dev/pts
mount --bind /proc proc
mount --bind /sys sys
chroot /mnt

passwd

hostname yourhostname

apt install linux-image-amd64 grub-pc sudo

#apt install firmware-amd-graphics -y
#apt install firmware-linux-nonfree
#grub-install /dev/sda
#update-grub

useradd -m -g users sb -s /bin/bash
passwd sb

echo 'sb ALL=(ALL)NOPASSWD:ALL'>>/etc/sudoers

sudo apt install openbox xterm alsa-utils mousepad pcmanfm tint2 fonts-wqy-microhei trojan firefox-esr -y

sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp true

mkdir -p ~/.config
cp -r /etc/xdg/openbox ~/.config
