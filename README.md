<h1>DELL xps13 2015 (9343) Linux Support</h1>
Tips and tricks to make XPS13 2015 work with linux.  
Last update : **2015-02-23**

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
For the moment, linux support on DELL XPS13 2015 is not at its best (hmm). The different encountered problems can be :
 - touchpad freezing (i2c / ps2 mode)
 - no sound (or sound after 2 cold reboots of some kernels, depending on boot options)
 - repeating keystroke issue (should be fixed with BIOS A01)
 - ?
 
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
 * Kernel: 4.0-rc1 ([linux-xps9343](https://github.com/soleblaze/linux-xps13-9343/tree/testing) testing)
 * Boot Options: enable_rc6=1 enable_fbc=1 lvds_downclock=1 pcie_aspm=force
 * Patches: Touchpad i2c [patch](https://github.com/soleblaze/linux-xps13-9343/blob/testing/touchpad.patch) to revert change made in 3.18.3
 * Distribution: Arch Linux
 * Pros: touchpad works
 * Cons: no audio, no palm detection

 ##CONFIG 3  (by [@mpalourdio] (https://github.com/mpalourdio))
 * Kernel: 3.16.0-30-generic (#40-14.04.1-Ubuntu)
 * Kernel Parameter: psmouse.resetafter=0
 * Distri : Linux Mint 17.1 Rebecca
 * Pro: Touchpad works / Touchscreen works
 * Con: No audio. acpi_osi="!Windows 2013" makes the touchpad freeze again
 * Sound can appear sometimes, when I switch between kernels (3.13 and 3.16). 3.16.0.31 makes the touchpad freeze, and there's no sound (whatever the boot kernel parameters)
  * Stock kernel (3.13) has sound all the time, but psmouse.resetafter doesn't seem to work
