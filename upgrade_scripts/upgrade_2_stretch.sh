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
