#!/usr/bin/env bash
set -e
if [[ "$(id -u)" != "0" ]]; then
   echo "Please run me as root!"
   exit 1
fi

wget 'http://ftp.us.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2019.1_all.deb'
wget 'http://ftp.us.debian.org/debian/pool/main/d/debian-keyring/debian-keyring_2019.02.25_all.deb'
wget 'http://repo.novena.io/debian/pool/main/k/kosagi-repo/kosagi-repo_1.3-r1_all.deb'
sha256sum -c <<END
9cefd8917f3d97a999c136aa87f04a3024408b5bc1de470de7d6dfa5e4bd4361  debian-archive-keyring_2019.1_all.deb
7cd4afff84e4990b87479e20cb1235f9deff6ff4d65df7db1c9d713f99fb41d3  debian-keyring_2019.02.25_all.deb
d9a293d5587712c01c92449307359c7a1d7ffc94b29387dc61cbd6c5b02d7271  kosagi-repo_1.3-r1_all.deb
END
dpkg -i debian-archive-keyring_2019.1_all.deb debian-keyring_2019.02.25_all.deb kosagi-repo_1.3-r1_all.deb

if grep -q '/dev/disk/by-path/platform-2198000.usdhc-part3 /' /proc/mounts; then
  cp /uboot/novena.dtb /uboot/novena.recovery.dtb
  cp /uboot/zimage /uboot/zImage.recovery
fi
