Upgrading from Jessie or Stretch
--------------------------------

To upgrade to novena-next:

1. Create a backup
2. Download this repo
3. Switch to the root user and enter the upgrade_scripts directory
4. Run upgrade_1_prep.sh
5. Run upgrade_2_stretch.sh then reboot. (Skip if you're on Stretch already)
6. Run upgrade_3_buster.sh then reboot. (Skip if you're on Buster already)
7. Run upgrade_4_bullseye.sh then reboot. (Skip if you're on Bullseye already)
8. Run upgrade_4_apt.sh then reboot. (Skip reboot if upgrading kernel next)

You should now have an up to date Bullseye system with a newer kernel.

Installing the beta 4.19 kernel
-------------------------------

To optionally install the beta 4.19 kernel run upgrade_5_BETA_KERNEL.sh

This kernel currently has three known regression from xobs' 4.4 kernel:

1. The audio crackles due to what appears to be a sampling issue
2. The front panel power LED turns off
3. The RTC may not work (this may just be one of my boards though)
