<h1>DELL xps13 2015 (9343) Linux Support</h1>
Tips and tricks to make XPS13 2015 work with linux.  
Last update : **2015-02-23**

## Other resources
[major.io website] (https://major.io/2015/02/03/linux-support-dell-xps-13-9343-2015-model/)  
[Barton's blog last update, announcing BIOS A01] (http://bartongeorge.net/2015/02/23/update-2-dell-xps-13-laptop-developer-edition-sputnik-gen-4/)  
[Kernel bug ticket for the sound issue] (https://bugzilla.kernel.org/show_bug.cgi?id=93361)  
[Patch for the touchpad] (http://lkml.iu.edu/hypermail/linux/kernel/1502.2/02389.html)  
[XPS13 2015 drivers page] (http://www.dell.com/support/home/us/en/04/product-support/product/xps-13-9343-laptop/drivers)  
[Dell XPS 13 2015 model 9343 on Ubuntu 15.04, dmidecode, lsusb, lspci] (https://gist.github.com/semenko/60015029e13c1de65ff6)  
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

##CONFIG 2
