# << Return to [README](README.md)

Configurations are organised by BIOS, since it has impact on all the
rest. BIOS are listed from the most recent to the oldest

# A19

## CONFIG #A19_01 (by [@timwienk](https://github.com/timwienk))
  * Model: XPS 13 9343-6782 (Core i7-5600U, FullHD non-touchscreen, Intel 7265 Wifi)
  * Distribution: Debian Stretch 9.8
  * Boot mode: UEFI
  * Kernel: 4.19.16-1~bpo9+1 (2019-02-07)
  * Kernel Parameters: None
  * Patches: No patches applied manually
  * Specific packages used:
    - firmware-iwlwifi (>= 20151018, non-free) - [wiki page](https://wiki.debian.org/iwlwifi)
      + *Note:* Models with broadcom card have no use for these drivers, look at [this page for Debian](https://wiki.debian.org/wl) or [this page for Ubuntu](https://help.ubuntu.com/community/WifiDocs/Driver/bcm43xx) instead
      + Install from [backports](https://backports.debian.org/Instructions) when using Debian Jessie 8.x
  * Specific packages used for Debian Jessie 8.x only (from [backports](https://backports.debian.org/Instructions)):
    - linux-image-amd64 (>= 4.1+66)
      + With this newer kernel audio works completely (including microphone)
      + Audio still in HDA mode (if used in I2C mode on previous boot (i.e. in Windows), an extra cold boot is needed after booting once to switch to HDA)
    - xserver-xorg-video-intel (>= 2:2.99)
      + This newer version is required for DRI to work with the broadwell CPU
  * Config files:
    - Swap HDA devices: [/etc/modprobe.d/intel-hda.conf](A19_01/intel-hda.conf)
    - Blacklist psmouse: [/etc/modprobe.d/psmouse-blacklist.conf](A19_01/psmouse-blacklist.conf)
    - User specific xsession (with touchpad settings): [~/.xsession](A19_01/.xsession)
  * Untested:
    - Bluetooth
    - Actual DisplayPort output (only tested with HDMI adapter)
  * Known issues:
    - No palm detection on touchpad with "synaptics" or "multitouch" drivers, "libinput" (on Debian Stretch) does a better job
      + *Note:* When "xserver-xorg-input-synaptics" and/or "xserver-xorg-input-multitouch" are installed, default configuration prefers these over "libinput"
  * Other accessories used:
    - Dell 470-ABBT, USB 3 to Ethernet adapter (rtl8153 chip, works out of the box)
    - Dell 470-13629, Mini DisplayPort to HDMI adapter (works out of the box)
    - Dell 460-BBGZ, Padded sleeve with pocket (officially for 12" Dell notebooks, pocket used for accessories + charger, fits perfectly)


# A11

## CONFIG #A11_01 (by [@mpalourdio](https://github.com/mpalourdio))
  * QHD version, i7-5600u, intel 7265 wifi
  * Kernel: 4.8.0-42-generic #45~16.04.1-Ubuntu SMP
  * Kernel Parameters: i915.enable_rc6=1 i915.lvds_downclock=1 pcie_aspm=force
  * Distribution: Linux Mint 18.1 Sarah
  * Pro: Microphone ok / Touchscreen works / Sound ok
  * Cons : Suspend / Hibernate mode doesn't work all the time (From last months, OK most of the time)
  * Palmdetect and disable touchpad when typing work now (using libinput)
  * Touchpad config : [50-synaptics.conf](A11_01/50-synaptics.conf) or [90-libinput.conf](A11_01/90-libinput.conf) to create in ``/etc/X11/xorg.conf.d``
  * Blacklist psmouse : [psmouse-blacklist.conf](A11_01/psmouse-blacklist.conf)
  * [HiDPI tweaks](HiDPI)
  * Dell D3100 docking station -> DisplayLink drivers v1.3.52


# A06

## CONFIG #A06_01 (by [@fillier](https://github.com/fillier))
  * Model: XPS 13 9343 (Core i5-5200U, Broadcom Wifi)
  * Kernel: 4.2.0-16-generic
  * Kernel Parameters: pcie_aspm=force i915.enable_fbc=1 i915.enable_rc6=7
  * Distribution: Ubuntu 15.10 (Wily)
  * Boot mode UEFI
  * Specific configurations:
    - i8k for fan control
    - smm to disable bios fan control (fights with i8k)
    - tlp for power management
    - psensor to monitor temps and fan speed
    - blacklisted psmouse
    - enabled TearFree xorg.conf
  * Cons:
    - using smm 30a3 disables brightness control and power button(s)
    - ~~battery life seem less than expected~~ (better since using tlp)
    - wifi does not always work when resuming (haven't seen this happen for a while)
    - ~~bluetooth connection to logitech H800 headset fails~~ (see notes)
  * Notes:
    - Followed instructions here: [http://askubuntu.com/a/632348] and got bluetooth fully working with Logitech M557 Mouse and Logitech H800 headset.


# A05

## CONFIG #A05_01 (by [@kumy](https://github.com/kumy))
  * Kernel: 3.19.0-30-generic
  * Kernel Parameters: None
  * Distri: Ubuntu 15.04 (Vivid)
  * Pro: Everything seems to be working fine.
  * Cons:
    - Microphone might not work? (not tested)
    - Mouse flickering on main screen while using Docking Station.
  * Boot mode UEFI
  * Wireless channels 12 and 13 are not available for use: [debian wiki](https://wiki.debian.org/wl#Known_Issues)
  * Docking Station D3100 working with one HDMI and one DisplayPort. Driver: 1.0.138

## CONFIG #A05_02 (by [@alessio](https://github.com/alessio))
  * QHD Touchscreen version, Intel i7-5600U, Intel 7265 WiFi
  * Touchpad firmware A00 (http://downloads.dell.com/FOLDER02883019M/1/9343_Firmware_T792T_WN32_18.1.48_A00.EXE)
  * Kernel: 4.2.0-16-generic
  * Kernel Parameters: `video=vesafb:ywrap,mtrr:3 i915.enable_rc6=1 i915.lvds_downclock=1 pcie_aspm=force`
  * Distribution: Ubuntu 15.10
  * Touchpad config: Put [configure_touchpad.sh](A05_02/configure_touchpad.sh) somewhere and add it to the list of startup applications with `gnome-session-properties` to enable palm detect and mid-button emulation with left+right tap.
  * Blacklist psmouse as it seems causing X to be unstable: [psmouse-blacklist.conf](A11_01/psmouse-blacklist.conf)
  * TTY consoles font improvements: [console-setup](A05_02/console-setup) , overwrite the existing one in ``/etc/default/``
    - This is needed to workaround [Debian bug#759657](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=759657)
  * Disable Bluetooth and apply TTY's font improvements at boot : [rc.local](A05_02/rc.local) , overwrite the existing one in ``/etc/``
  * Scale GRUB menu: [HiDPI tweaks](HiDPI/grub.md)
  * Sound works like a charm. Internal mic, speakers and headset automatic switch: it's all working well
  * Cons: none


# A04

## CONFIG #A04_01 (by [@tombh](https://github.com/tombh))
  * Kernel: 4.0.0-1-amd64 #1 SMP Debian 4.0.2-1
  * Kernel Parameters: none
  * Patches: None
  * Distro: Debian Sid
  * Pro: Sound, Suspend, no keyboard glitches, no touchpad freezes
  * Cons: Touchpad multitouch, no microphone (haven't tried to fix yet though)
  * HiDPI: I find `Xft.dpi: 125` in `~/.Xresources` is the best fit for resolution/font sizes

## CONFIG #A04_02 (by [@rpbaptist](https://github.com/rpbaptist))
  * Kernel 4.0 ([Patched as instructed here](http://forthescience.org/blog/2015/04/21/installing_ubuntu_14_04_on_the_new_dell_xps_13_v2/))
  * Kernel Parameters: pcie_aspm=force i915.i915_enable_fbc=1
  * Distribution: Linux Mint 17.1
  * Configuration as listed in same link as mentioned in kernel link.
  * Pro: Wifi works, sound, headphone detection, microphone.
  * Con: Touchpad palm detection not working. (ic2) Sound over displayport appears randomly. Cannot enable manually.
  * Boot mode: UEFI

## CONFIG #A04_03 (by [@bric3](https://github.com/bric3))
  * Kernel: 4.1.2-040102-generic (installed from [ubuntu mainline builds](https://wiki.ubuntu.com/Kernel/MainlineBuilds) [4.1.2-unstable](http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.1.2-unstable/))
  * Kernel Parameters: None
  * Patches: No patches applied manually
  * Distribution: Ubuntu Gnome 15.04 (Vivid)
  * Wifi driver : [build for 4.1+](https://launchpad.net/ubuntu/+source/bcmwl/6.30.223.248+bdcom-0ubuntu3/+build/7418309) as [recommended by this Dell guy](http://en.community.dell.com/techcenter/os-applications/f/4613/p/19638068/20780337#20780337)
  * Touchpad config : [`50-synaptics.conf`](A04_03/50-synaptics.conf) to put in `/etc/X11/xorg.conf.d/`
    * No button softarea (_à la Apple Trackpad_)
    * Third finger is the middle button on regular mouse (i.e. it pastes)
    * Also disabled [GNOME settings daemon](https://wiki.archlinux.org/index.php/Touchpad_Synaptics#GNOME.2FCinnamon) as it overrides my X11 config (no equivalent in GNOME settings dialog)
    * Disabled mouse
  * Touchscreen disabled : [`99-no-touchscreen.conf`](A04_03/99-no-touchscreen.conf) to put in `/etc/X11/xorg.conf.d/`
  * Pro: Almost everything seem to work fine
  * Cons:
    * I had to install (reinstall) manually drivers Bluetooth and Wifi to make it work well
    * Nasty trackpad bug in the kernel fixed in 4.1, but still palm detection nat working well, trackpad not disabled when typing (b/c Gnome settings disabled)
  * Boot mode: BIOS
  * HiDPI stuff:
    * Applied all (application and external displays) tricks from Arch Linux [wiki](https://wiki.archlinux.org/index.php/HiDPI)
    * And those [tweaks](HiDPI) by [@mpalourdio](https://github.com/mpalourdio)


# A03

## CONFIG #A03_01 (by [@soleblaze](https://github.com/soleblaze))
 * Kernel: 4.1-rc3 ([linux-xps9343](https://github.com/soleblaze/linux-xps13-9343/tree/testing) testing)
 * Kernel Parameters: i915.enable_rc6=1 i915.enable_fbc=1 i915.lvds_downclock=1 pcie_aspm=force
 * [/etc/X11/xorg.conf.d/50-synaptics.conf](https://gist.github.com/soleblaze/975bc2b0e5e69137fd08) is configured for palm detection and clickpad
 * Patches: None
 * Distribution: Arch Linux
 * Pros: touchpad and sound work.
 * Cons: palm detection does not work

## CONFIG #A03_02 (by [@xbcrespo](https://github.com/xbcrespo))
  * Kernel: 3.16.0-4
  * Kernel Parameters: none
  * Distri : Debian Jessie
  * Cons : Mic doesn't work.Touchpad not working properly (touch clicks are not being detected and two-finger gestures block the touchpad)
  * Wifi config : Follow the next tutorial: [Broadcom drivers](https://wiki.debian.org/wl)
  * Sound is working, altough I had to select "Speakers" in the sound configuration menu (Gnome 3)

## CONFIG #A03_03 (by [@linquize](https://github.com/linquize))
  * Touchpad firmware A00
  * Kernel: 3.19.0-18-generic #18-Ubuntu SMP
  * Kernel Parameters: None
  * Distribution: Ubuntu 15.04 (Vivid) x64
  * Pro: This kernel makes microphone to work.
  * Cons: None
  * Boot mode: UEFI with secure boot


# A02

## CONFIG #A02_01 (by [@pcolby](https://github.com/pcolby))
  * Kernel: 3.18.0-13-generic #14-Ubuntu SMP
  * Kernel Parameters: None
  * Distri: Kubuntu 15.04 Beta 1 (kubuntu-15.04-beta1-desktop-amd64)
  * Pro: Everything seems to be working fine, including audio (haven't had time to test thoroughly yet).
  * Cons: Microphone might not work? (not tested)
  * Custom HiDPI config : [90-eDP1.conf](A02_01/90-eDP1.conf) in `/usr/share/X11/xorg.conf.d`


# A01

## CONFIG #A01_01 (by [@mpalourdio](https://github.com/mpalourdio))
 * QHD version, i7-5600u, intel 7265 wifi
 * Kernel: 3.16.0-30-generic (#40-14.04.1-Ubuntu)
 * Kernel Parameters: psmouse.resetafter=0 && acpi_osi="!Windows 2013"
 * Distri : Linux Mint 17.1 Rebecca
 * Pro: Touchpad works / Touchscreen works
 * Sound seems ok, (3.13 and 3.16.30). 3.16.0.31 makes the touchpad freeze, and there's no sound (whatever the boot kernel parameters)
 * Stock kernel (3.13) has sound all the time
 * 3.16.x has very poor wifi (intel 7265), 3.13 doens't have this problem.

## CONFIG #A01_02 (by [@mpalourdio](https://github.com/mpalourdio))
 * QHD version, i7-5600u, intel 7265 wifi
 * Kernel: 3.18.7 and/or 3.18.8 and/or 3.19.1/3.19.2 (3.19.0 = kernel panic)
 * Kernel Parameters: psmouse.resetafter=0 && acpi_osi="!Windows 2013"
 * Distri : Linux Mint 17.1 Rebecca
 * Pro: Touchpad works / Touchscreen works / Sound ok
 * Poor wifi (intel 7265). Fix : iwconfig wlan0 power off => seems much better with 3.18.8/3.19.1 and last linux firmware.
 * Cons : Microphone doesn't work. Suspend mode doesn't work all the time. Sometines, touchpad jumbs to screen border. Dmesg populated with message

## CONFIG #A01_03 (by [@timdj](https://github.com/timdj))
 * Kernel: 4.0-rc1 custom build with patched i2c-hid and hid-multitouch
 * Kernel Parameters: acpi_osi="!Windows 2013" pmouse.resetafter=0 i915.enable_fbc=1 i915.lvds_downclock=1 pcie_aspm=force i915.enable_psr=1
 * Distribution : Linux Mint 17.1 Rebecca
 * Pro: Touchpad works / Touchscreen works / Sound ok
 * Applied patches: i2c-hid, hid-multitouch [latest firmware package](https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git) and [latest firmware for intel 7265](https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/linux-firmware.git)
 * Cons
   - Still not happy with touchpad, no palmdetect, moving cursor on button click.
   - Suspend, poweroff and reboot does not always work.
   - Microphone not working
 * after using kernel parameters above and installing tlp my idle power usage (low brightness QHD+ screen) is down to 3.16W with WiFi / 3.03W withouth WiFi


# A00

## CONFIG #A00_01 (by [@janhenke](https://github.com/janhenke))
 * Kernel: 3.16.0-30-generic (Ubuntu 14.10)
 * Kernel Parameter: none
 * Pro: Touchpad works perfectly
 * Con: No audio (at all)
