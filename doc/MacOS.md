
## UNDER CONSTRUCTION

# MacOS


See also
- [Homebrew](Homebrew.md)


---

About getting appleid without credit cards:
https://appletoolbox.com/2016/01/how-to-create-an-apple-id-without-credit-card/
https://support.apple.com/en-us/HT204034

---

RDP client:
https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12

---

Automake tools on Mac:

    $ ﻿brew install automake

(At some point I needed autoreconf, this helped)

---

To add PATH on Mac
Simple way is to add PATH to file ```~/.bash_profile```. Like so:

    ﻿export PATH="/usr/local/someprogramijustwrote/bin:$PATH"

---

Screenshot capture:
1. Click ```Shift-Command-4```, or, I guess ```Command-$```
2. Mark it with mouse.
3. The file is in Desktop with .png extention and timestamp.

---

Video capture can be done using QuickTime(that is part of standard Applications)
1. Click 'New Screen Recording'
2. Mark area with the mouse
3. Click 'Stop recording' button on the menu when done.
4. It will be saved in .mov format.

http://www.loopinsight.com/2014/01/08/your-macs-built-in-screen-recorder/

---

to get `http`(the command line http client):

    $ brew install httpie

---

To get the number of CPUs
    
    $ sysctl hw.physicalcpu hw.logicalcpu
    hw.physicalcpu: 4
    hw.logicalcpu: 8

---

