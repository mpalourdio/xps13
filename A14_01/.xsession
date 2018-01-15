# ~/.xsession

# Set touchpad options.
#/usr/bin/synclient TapButton1=1 EmulateMidButtonTime=0 HorizTwoFingerScroll=1 PalmDetect=1 PalmMinWidth=8 PalmMinZ=100
#/usr/bin/synclient ClickPad=1 RightButtonAreaLeft=660 MiddleButtonAreaRight=659 MiddleButtonAreaLeft=575 RightButtonAreaTop=557 MiddleButtonAreaTop=557
xinput --set-prop 'DLL0665:01 06CB:76AD Touchpad' 'libinput Tapping Enabled' 1
xinput --set-prop 'DLL0665:01 06CB:76AD Touchpad' 'libinput Tapping Drag Enabled' 1
xinput --set-prop 'DLL0665:01 06CB:76AD Touchpad' 'libinput Natural Scrolling Enabled' 0
xinput --set-prop 'DLL0665:01 06CB:76AD Touchpad' 'libinput Disable While Typing Enabled' 0

# Start window manager.
/usr/bin/x-window-manager
