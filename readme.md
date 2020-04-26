Introduction
------------

In 2014 the Novena open source laptop was announced.
In 2019 the laptop officially hit end of life.

novena-next aims to extend the lifetime of the laptop indefinitely.

Current goals:
- Release a newer set of kernel patches
- Create an update path from the stock Jessie firmware to Buster
- Create new SD card images for easy installing

Future goals:
- Support the *BSDs
- Upstream most Novena patches

Please report all issues or ideas in this bug tracker.

Repositories
------------

This project is split up in to many different Git repositories.

Documentation repositories:
- [novena-next/docs](https://github.com/novena-next/docs)
  contains this guide, a general issue tracker and various upgrade scripts

Kernel repositories:
- [novena-next/kernel-patches](https://github.com/novena-next/kernel-patches)
  contains distro-independent patch sets for Novena-specific features
- [novena-next/linux](https://github.com/novena-next/linux)
  contains the Git development tree for the patch sets

Userspace repositories:
- [novena-next/xf86-video-armada](https://github.com/novena-next/xf86-video-armada)
  is a maintained fork of Russel King's xf86-video-armada repository
- [novena-next/xorg-novena](https://github.com/novena-next/xorg-novena)
  contains sample Xorg configuration for xf86-video-armada
- [novena-next/pulseaudio-novena](https://github.com/novena-next/pulseaudio-novena)
  contains PulseAudio configuration for the Novena sound system

Software repositories:
- [novena-next/novena-bluetooth-reset](https://github.com/novena-next/novena-bluetooth-reset)
  resets the Bluetooth subsystem when you hit the USER button
- [novena-next/novena-disable-ssp](https://github.com/novena-next/novena-disable-ssp)
  disables SSP on all attached Bluetooth devices
- [novena-next/novena-eeprom](https://github.com/novena-next/novena-eeprom)
  allows viewing and editing the Novena EEPROM values
- [novena-next/novena-eeprom-gui](https://github.com/novena-next/novena-eeprom-gui)
  allows viewing and editing the Novena EEPROM values in a Qt5 GUI
- [novena-next/novena-usb-hub](https://github.com/novena-next/novena-usb-hub)
  allows powering up or down the various USB hubs in the Novena
- [novena-next/novena-whack-lcd](https://github.com/novena-next/novena-whack-lcd)
  tries to reset the LCD when you hit the USER button

Firmware repositories:
- [novena-next/firmware-senoko](https://github.com/novena-next/firmware-senoko)
  contains the source code for the Senoko and passthrough board firmware

Debian package repositories:
- [novena-next/debian-linux](https://github.com/novena-next/debian-linux)
  contains the Debian package source for the Novena kernel variant
- [novena-next/etna_viv](https://github.com/novena-next/etna_viv)
  contains the Debian package source for the libetnaviv-headers package
- [novena-next/libdrm-armada](https://github.com/novena-next/libdrm-armada)
  contains the Debian package source for the libdrm-armada package

Unused repositories
-------------------

These are not included in the novena-next project for various reasons:

- [xobs/libetnaviv](https://github.com/xobs/libetnaviv)
  is obsoleted by the [novena-next/etna_viv](https://github.com/novena-next/etna_viv)
  repository
- [xobs/novena-debian-support](https://github.com/xobs/novena-debian-support)
  is obsoleted by Debian's flash-kernel program and novena-next's configuration
- [xobs/novena-firstrun](https://github.com/xobs/novena-firstrun)
  will be replaced by official distribution install scripts
- [xobs/novena-heirloom](https://github.com/xobs/novena-heirloom)
  just turns the fan on and is no longer required with the newer kernel
- [xobs/novena-image](https://github.com/xobs/novena-image)
  will be replaced by official distribution generation scripts

Code signing
------------

Git tags for each repository release is signed with Jookia's key:
- gpg --recv-key 1439014EF601F45269400315BFE88BA2235C8BDF

The novena-next apt repository is signed with a separate key:
- gpg --recv-key 72365C0E95BD25A7EE20C812DDC2AFA22D5777A9

Please always verify Git tags before using them in production.
