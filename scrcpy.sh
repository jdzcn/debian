#!/bin/bash

#sudo apt install snapd
#sudo snap install core
#sudo snap install scrcpy

/snap/bin/scrcpy.adb tcpip 5555

/snap/bin/scrcpy.adb connect 192.168.1.128:5555

/snap/bin/scrcpy -ST