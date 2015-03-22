<h1>DELL xps13 2015 (9343) Linux Support</h1>
Tips and tricks to make XPS13 2015 work with linux.

~~BIOS A01 is [out] (http://www.dell.com/support/home/us/en/04/Drivers/DriversDetails?driverID=RHPC0&productCode=xps-13-9343-laptop)~~  
BIOS A02 is [out] (http://www.dell.com/support/home/en/en/nldhs1/Drivers/DriversDetails?driverId=F2PRR)

## Other resources
[major.io website] (https://major.io/2015/02/03/linux-support-dell-xps-13-9343-2015-model/) ([@major] (https://github.com/major))  
[Barton's blog last update, announcing BIOS A01] (http://bartongeorge.net/2015/02/23/update-2-dell-xps-13-laptop-developer-edition-sputnik-gen-4/)  
[Kernel bug ticket for the sound issue] (https://bugzilla.kernel.org/show_bug.cgi?id=93361) by [@major] (https://github.com/major)    
[Patch for the touchpad] (http://lkml.iu.edu/hypermail/linux/kernel/1502.2/02389.html)  
[XPS13 2015 drivers page] (http://www.dell.com/support/home/us/en/04/product-support/product/xps-13-9343-laptop/drivers)  
[Dell XPS 13 2015 model 9343 on Ubuntu 15.04, dmidecode, lsusb, lspci] (https://gist.github.com/semenko/60015029e13c1de65ff6) by [@semenko] (https://github.com/semenko)  
[Patch that you can apply to 3.18 or 3.19 kernels that eliminates the trackpad freeze] (https://bugzilla.redhat.com/attachment.cgi?id=990188) by [@major] (https://github.com/major)  
IRC : #xps13 (freenode)

**Quote about the repeating keystroke issue (Author ?)**  
``Someone asked about the fix for the repeating keypresses. Yes, it was traced back to the source and will be fixed on all affected Dell platforms soon. I just saw that the one for 9343 was promoted to our factories so should be up on support.dell.com any day now as BIOS A01``

## Actual situation
From A01, linux support is quite decent. The different encountered problems can be :
 - touchpad freezing (i2c / ps2 mode)
 - no sound (or sound after 2 cold reboots of some kernels, depending on boot options)
 - ~~repeating keystroke issue (should be fixed with BIOS A01)~~ (fixed with BIOS A01)
 - ?
 
From A02, boot options are not needed anymore, sound will be ok and touchpad will be in i2c mode ! It's still recommended to have a recent kernel (3.17+). Verify your touchpad mode with ``xinput``.  
It should give you something like ``DLL0665:01 06CB:76AD UNKNOWN``. You should have to blacklist psmouse too? See [here](config6/50-synaptics.conf).

 
## What about you ?
If you (are able to) use linux on this computer, please specify :
 - kernel version
 - boot options
 - pros/cons of this combo
 - applied patches
 - distribution
 - anything you think is useful to know  
 
Thanks to contributors !
 
##CONFIG 1  (by [@janhenke] (https://github.com/janhenke))
 * Kernel: 3.16.0-30-generic (Ubuntu 14.10)
 * Kernel Parameter: none
 * Pro: Touchpad works perfectly
 * Con: No audio (at all)

##CONFIG 2 (by [@soleblaze](https://github.com/soleblaze))
 * BIOS: A01
 * Kernel: 4.0-rc2 ([linux-xps9343](https://github.com/soleblaze/linux-xps13-9343/tree/testing) testing)
 * Kernel Parameters: enable_rc6=1 enable_fbc=1 lvds_downclock=1 pcie_aspm=force  psmouse.resetafter=0 acpi_osi="!Windows 2013"
 * [/etc/X11/xorg.conf.d/50-synaptics.conf](https://gist.github.com/soleblaze/975bc2b0e5e69137fd08) is configured for palm detection and clickpad
 * Patches: None
 * Distribution: Arch Linux
 * Pros: touchpad and sound work.  Palm detection works.
 * Cons: dmesg is flooded with "psmouse serio1: TouchPad at isa0060/serio1/input0 lost sync at byte 1" messages.

##CONFIG 3  (by [@mpalourdio] (https://github.com/mpalourdio))
 * BIOS A01
 * Kernel: 3.16.0-30-generic (#40-14.04.1-Ubuntu)
 * Kernel Parameter: psmouse.resetafter=0 && acpi_osi="!Windows 2013"
 * Distri : Linux Mint 17.1 Rebecca
 * Pro: Touchpad works / Touchscreen works
 * Sound seems ok, (3.13 and 3.16.30). 3.16.0.31 makes the touchpad freeze, and there's no sound (whatever the boot kernel parameters)
 * Stock kernel (3.13) has sound all the time
 * 3.16.x has very poor wifi (intel 7265), 3.13 doens't have this problem.

##CONFIG 4  (by [@mpalourdio] (https://github.com/mpalourdio))
 * BIOS A01
 * Kernel: 3.18.7 and/or 3.18.8 and/or 3.19.1/3.19.2 (3.19.0 = kernel panic)
 * Kernel Parameter: psmouse.resetafter=0 && acpi_osi="!Windows 2013"
 * Distri : Linux Mint 17.1 Rebecca
 * Pro: Touchpad works / Touchscreen works / Sound ok
 * Poor wifi (intel 7265). Fix : iwconfig wlan0 power off => seems much better with 3.18.8/3.19.1 and last linux firmware.
 * Cons : Microphone doesn't work. Suspend mode doesn't work all the time. Sometines, touchpad jumbs to screen border. Dmesg populated with message

##CONFIG 5  (by [@timdj] (https://github.com/timdj))
 * BIOS A01
 * Kernel: 4.0-rc1 custom build with patched i2c-hid and hid-multitouch
 * Kernel Parameter: acpi_osi="!Windows 2013" pmouse.resetafter=0 i915.enable_fbc=1 i915.lvds_downclock=1 pcie_aspm=force i915.enable_psr=1
 * Distribution : Linux Mint 17.1 Rebecca
 * Pro: Touchpad works / Touchscreen works / Sound ok
 * Applied patches: i2c-hid, hid-multitouch [latest firmware package](https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git) and [latest firmware for intel 7265] (https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/linux-firmware.git)
 * Cons
   - Still not happy with touchpad, no palmdetect, moving cursor on button click.
   - Suspend, poweroff and reboot does not always work.
   - Microphone not working
 * after using kernel parameters above and installing tlp my idle power usage (low brightness QHD+ screen) is down to 3.16W with WiFi / 3.03W withouth WiFi

##CONFIG 6  (by [@mpalourdio] (https://github.com/mpalourdio))
  * BIOS A02
  * Kernel: 3.19.2 
  * Kernel Parameter: NONE !
  * Distri : Linux Mint 17.1 Rebecca
  * Pro: Touchpad works / Touchscreen works / Sound ok
  * Cons : Microphone doesn't work. Suspend / Hibernate mode doesn't work all the time, no palmdetect (i2c mode)
  * Touchpad config : [50-synaptics.conf](config6/50-synaptics.conf) , to create in ``/etc/X11/xorg.conf.d``
  * Blacklist psmouse : [psmouse-blacklist.conf](config6/psmouse-blacklist.conf)

