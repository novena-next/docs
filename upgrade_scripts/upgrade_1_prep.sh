#!/usr/bin/env bash
set -e
if [[ "$(id -u)" != "0" ]]; then
   echo "Please run me as root!"
   exit 1
fi

wget 'http://deb.debian.org/debian/pool/main/d/debian-archive-keyring/debian-archive-keyring_2021.1.1_all.deb'
wget 'http://deb.debian.org/debian/pool/main/d/debian-keyring/debian-keyring_2021.03.24_all.deb'
wget 'http://repo.novena.io/debian/pool/main/k/kosagi-repo/kosagi-repo_1.3-r1_all.deb'
sha256sum -c <<END
56beca470dcd9b6d7e6c3c9e9d702101e01e9467e62810a8c357bd7b9c26251d  debian-archive-keyring_2021.1.1_all.deb
0b955b50d5d4e94bfd4d84578530f620e78938977f439f5fe883f0786b347c6c  debian-keyring_2021.03.24_all.deb
d9a293d5587712c01c92449307359c7a1d7ffc94b29387dc61cbd6c5b02d7271  kosagi-repo_1.3-r1_all.deb
END
dpkg -i debian-archive-keyring_2021.1.1_all.deb debian-keyring_2021.03.24_all.deb kosagi-repo_1.3-r1_all.deb
