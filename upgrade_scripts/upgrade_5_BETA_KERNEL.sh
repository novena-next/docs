#!/usr/bin/env bash
set -e
if [[ "$(id -u)" != "0" ]]; then
   echo "Please run me as root!"
   exit 1
fi

if [[ -f /boot/uEnv.txt ]]; then
   echo "uEnv.txt already exists. Please remove it!"
   exit 1
fi

mkdir /uboot
umount /boot
sed -i 's/\/boot/\/uboot/g' /etc/fstab
mount /uboot
rm /uboot/zimage

rm /etc/kernel/postinst.d/zz-novena-kernel-install
apt -y install flash-kernel
echo "NO_CREATE_DOT_BAK_FILES=1" >> /etc/default/flash-kernel
cat <<END >> /etc/flash-kernel/db

Machine: Kosagi Novena Dual/Quad
Kernel-Flavors: armmp novena
DTB-Id: imx6q-novena.dtb
U-Boot-Initrd-Address: 0x0
Boot-Kernel-Path: /uboot/zImage.buster
Boot-Initrd-Path: /uboot/initrd.buster
Boot-DTB-Path: /uboot/novena.buster.dtb
Boot-Script-Path:
Required-Packages: u-boot-tools
END

apt -y install linux-image-4.19.0-8-novena

# always load these
echo "eepromoops" > /etc/modules-load.d/novena.conf
echo "i2c_dev" >> /etc/modules-load.d/novena.conf

cat <<END > /uboot/uEnv.txt
dolatehook=if test ! -n \${rec} ; then \\
        env set bootargs 'iomem=relaxed console=ttymxc1,115200' ; \\
        setenv initrd_addr_r 0x13000000 ; \\
        fatload \${bootsrc} \${bootdev} \${kernel_addr_r} zImage.buster ; \\
        fatload \${bootsrc} \${bootdev} \${initrd_addr_r} initrd.buster ; \\
        fatload \${bootsrc} \${bootdev} \${fdt_addr_r}    novena.buster.dtb ; \\
        bootz \${kernel_addr_r} \${initrd_addr_r} \${fdt_addr_r} ; \\
fi ;
END
