<h1>DELL xps13 2015 (9343) Linux Support</h1>
Tips and tricks to make XPS13 2015 work with linux.

## Contributors configurations

See the collected configurations [here](configurations.md) (ordered by BIOS version)

## BIOS

~~BIOS A01 is [out] (http://www.dell.com/support/home/us/en/04/Drivers/DriversDetails?driverID=RHPC0)~~  
~~BIOS A02 is [out] (http://www.dell.com/support/home/en/en/nldhs1/Drivers/DriversDetails?driverId=F2PRR)~~  
~~BIOS A03 is [out] (http://www.dell.com/support/home/en/en/nldhs1/Drivers/DriversDetails?driverId=XY677)~~  
~~BIOS A04 is [out] (http://www.dell.com/support/home/us/en/04/Drivers/DriversDetails?driverId=133FN)~~  
BIOS A05 is [out] (http://www.dell.com/support/home/us/en/04/Drivers/DriversDetails?driverID=YMRTD)

## DELL patches/firmwares/drivers

[Touchpad firmware A00] (http://downloads.dell.com/FOLDER02883019M/1/9343_Firmware_T792T_WN32_18.1.48_A00.EXE) - Installs under windows only :(  
[XPS13 2015 drivers page] (http://www.dell.com/support/home/us/en/04/product-support/product/xps-13-9343-laptop/drivers)  

## Actual situation

From **A01**, linux support is quite decent. The different encountered problems can be :
 - touchpad freezing (i2c / ps2 mode)
 - no sound (or sound after 2 cold reboots of some kernels, depending on boot options)
 - ~~repeating keystroke issue (should be fixed with BIOS A01)~~ (fixed with BIOS A01 & A04)
 - ?
 
From **A02**, boot options are not needed anymore. Sound will be ok (HDA mode by default) and touchpad will be in i2c mode as ``!Windows 2013`` is not needed anymore to make audio work!  
It's still recommended to have a recent kernel (3.17+). Verify your touchpad mode with ``xinput``.  
It should give you something like ``DLL0665:01 06CB:76AD UNKNOWN`` if i2c mode is on. You could have to blacklist psmouse too. See [here](A04_01/psmouse-blacklist.conf).

BIOS **A04** : ``relevant things to linux are: keyboard repeat delay, fix an intermittent hang up at POST, update EC, update CPU microcode,  intel platform trust technology updates``

Anyway, you should upgrade BIOS to the latest version (at your own risk !). To upgrade, download the BIOS .exe, and save it in ``/boot/efi``. Double-check the checksum, reboot, press F12 and patch.

**Quote about the repeating keystroke issue (Author ?)**  
``Someone asked about the fix for the repeating keypresses. Yes, it was traced back to the source and will be fixed on all affected Dell platforms soon. I just saw that the one for 9343 was promoted to our factories so should be up on support.dell.com any day now as BIOS A01``

## Other resources

[major.io website] (https://major.io/2015/02/03/linux-support-dell-xps-13-9343-2015-model/) ([@major] (https://github.com/major))  
[Barton's blog last update, announcing BIOS A01] (http://bartongeorge.net/2015/02/23/update-2-dell-xps-13-laptop-developer-edition-sputnik-gen-4/)  
[Installing ubuntu 14.04 on the new Dell XPS 13](http://forthescience.org/blog/2015/04/21/installing_ubuntu_14_04_on_the_new_dell_xps_13_v2)  
[Promising patches from Matthew Garret about reducing power consumption on Haswell and Broadwell systems] (https://mjg59.dreamwidth.org/34868.html)  
[ArchWiki dedicated to Dell XPS 13 (2015)] (https://wiki.archlinux.org/index.php/Dell_XPS_13_%282015%29)  
IRC : #xps13 (freenode)

## What about you ?

If you (are able to) use linux on this computer, please specify :
 - your xps13 model (FHD/QHD, CPU, wifi chipset)
 - kernel version
 - boot options
 - pros/cons of this combo
 - applied patches
 - distribution
 - anything you think is useful to know  
 
Thanks to contributors !
