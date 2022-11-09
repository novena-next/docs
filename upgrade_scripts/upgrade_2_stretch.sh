#!/usr/bin/env bash
set -e
if [[ "$(id -u)" != "0" ]]; then
   echo "Please run me as root!"
   exit 1
fi
sed -i 's/jessie/stretch/g' /etc/apt/sources.list
# The kosagi repo doesn't resolve anymore and will cause an error in apt update
# if it is not removed first
rm /etc/apt/sources.list.d/kosagi.list || true
rm /etc/apt/trusted.gpg.d/kosagi.gpg || true
# We will also need some additional keys to get updates
apt-key adv --keyserver keyserver.ubuntu.com --recv-key AA8E81B4331F7F50
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 112695A0E562B32A
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 04EE7237B7D453EC
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 648ACFD622F3D138
apt-key adv --keyserver keyserver.ubuntu.com --recv-key 0E98404D386FA1D9
apt-key adv --keyserver keyserver.ubuntu.com --recv-key EF0F382A1A7B6500
apt update
apt-get -y -oAPT::Force-LoopBreak=1 dist-upgrade

apt remove -y xorg-novena xserver-xorg-video-armada-dbg libetnaviv libetnaviv-dbg libetnaviv-dev libdrm-armada-dev libdrm-armada-dev libdrm-armada2 libdrm-armada-dev libdrm-armada2-dbg
apt install -y xserver-xorg-core xserver-xorg-input-all
cat >/etc/X11/xorg.conf <<EOF
Section "Device"
  Identifier "novena"
  Driver "modesetting"
  Option "AccelMethod" "none"
EndSection
EOF
