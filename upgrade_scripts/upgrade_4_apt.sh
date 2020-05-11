#!/usr/bin/env bash
set -e
if [[ "$(id -u)" != "0" ]]; then
   echo "Please run me as root!"
   exit 1
fi

apt install -y i2c-tools u-boot-tools

apt remove -y kosagi-repo
rm /etc/apt/sources.list.d/kosagi.list || true
rm /etc/apt/trusted.gpg.d/kosagi.gpg || true
gpg --recv-key '72365C0E95BD25A7EE20C812DDC2AFA22D5777A9'
gpg --export '72365C0E95BD25A7EE20C812DDC2AFA22D5777A9' | apt-key add -
echo 'deb https://novena.jookia.org/ buster main' > /etc/apt/sources.list.d/novena-next.list
echo 'deb-src https://novena.jookia.org/ buster main' >> /etc/apt/sources.list.d/novena-next.list
apt update
apt -y upgrade
rm /etc/X11/xorg.conf
apt install -y xorg-novena i2c-tools
