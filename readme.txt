sudo -i
fdisk -l
mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

/etc/apt/sources.list
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free

apt update

apt install debootstrap -y

debootstrap buster /mnt http://mirrors.tuna.tsinghua.edu.cn/debian

echo 'debian' >/mnt/etc/hostname
echo '127.0.0.1 debian.localdomain debian'>>/mnt/etc/hosts
cp /etc/network/interfaces /mnt/etc/network
blkid > /mnt/etc/fstab
UUID=*** / ext4 defaults 0 1

cd /mnt
mount --bind /dev dev
mount --bind /dev/pts dev/pts
mount --bind /proc proc
mount --bind /sys sys
chroot /mnt

passwd

#blkid > /etc/fstab & nano /etc/fstab
#echo 'UUID=*** / ext4 defaults 0 1' >/etc/fstab

#/etc/network/interfaces
#auto enp2s0
#iface enp2s0 inet dhcp/static
#address 192.168.1.2
#gateway 192.168.1.1

#ifdown enp2s0
#ifup enp2s0

/etc/apt/sources.list
deb http://mirrors.ustc.edu.cn/debian stable main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/debian stable main contrib non-free
deb http://mirrors.ustc.edu.cn/debian stable-updates main contrib non-free

apt update
apt install linux-image-amd64 grub-pc

#grub-install /dev/sda
#update-grub

useradd -m -g users sb -s /bin/bash
passwd sb
apt install sudo
echo 'sb ALL=(ALL)NOPASSWD:ALL'>>/etc/sudoers

#apt install firmware-amd-graphics -y
#apt install firmware-linux-nonfree

sudo apt install openbox xterm alsa-utils mousepad pcmanfm tint2 fonts-wqy-microhei trojan firefox-esr -y

sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp true

#git clone https://github.com/jdzcn/debian

mkdir -p ~/.config
cp -r ~/debian/openbox ~/.config

sudo cp ~/debian/trojan-client-config.json /etc/trojan/config.json
#sudo nano /etc/trojan/config.json
sudo systemctl start trojan
sudo systemctl enable trojan

23.openbox常用设置

	$ mkdir -p ~/.config
	$ cp -r /etc/xdg/openbox ~/.config

	autostart文件：
	pcmanfm --desktop &
	tint2 &
	
	#debian
	#volti &
	
	# Volume
	if which volumeicon >/dev/null 2>&1; then
       		volumeicon &
	fi

	#feh --bg-scale ~/Downloads/dp.jpg
	fcitx &
	#conky&amp;

	rc.xml文件：
<!-- Keybindings for running applications -->
<keybind key="A-r">
<action name="Execute">
<execute>dmenu_run</execute>
</action>
</keybind>
<keybind key="A-space">
<action name="Execute">
<execute>uxterm</execute>
</action>
</keybind>
<keybind key="A-Up">
<action name="Execute">
<command>amixer set Master 5%+</command>
</action>
</keybind>
<keybind key="A-Down">
<action name="Execute">
<command>amixer set Master 5%-</command>
</action>
</keybind>
<keybind key="A-m">
<action name="Execute">
<command>amixer set Master toggle</command>
</action>
</keybind>
 <keybind key="Print">
      <action name="Execute">
         <startupnotify>
           <enabled>false</enabled>
           <name>Snapshot</name>
        </startupnotify>
         <command>scrot images.png</command>
       </action>
     </keybind>
     <keybind key="S-Print">
       <action name="Execute">
         <startupnotify>
           <enabled>false</enabled>
           <name>Snapshot with Frame</name>
         </startupnotify>
         <command>scrot -bs images.png</command>
       </action>
     </keybind>
     <keybind key="C-Print">
       <action name="Execute">
         <startupnotify>
           <enabled>false</enabled>
           <name>Snapshot Fullscreen</name>
         </startupnotify>
         <command>scrot -s images.png</command>
       </action>
     </keybind>



	menu.xml文件：

<menu id="exit-menu" label="Exit">
<item label="Log Out">
<action name="Execute">
<command>openbox --exit</command>
</action>
</item>
<item label="Shutdown">
<action name="Execute">
<command>systemctl poweroff</command>
</action>
</item>
<item label="Restart">
<action name="Execute">
<command>systemctl reboot</command>
</action>
</item>
<item label="Suspend">
<action name="Execute">
<command>systemctl suspend</command>
</action>
</item>
<item label="Hibernate">
<action name="Execute">
<command>systemctl hibernate</command>
</action>
</item>
</menu>
