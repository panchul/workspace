[Home](Readme.md)
# MacOS

See also:

  - [Homebrew](Homebrew.md)
  - [Porter](Porter.md)

---

**Contents**

- [Shortcuts, etc.](MacOS.md#shortcuts-etc)
- [Quarantine attributes](MacOS.md#quarantine-attributes)
- [Debugging](MacOS.md#debugging)
- [Screen capture tools](MacOS.md#screen-capture-tools)
- [Miscellaneous](MacOS.md#miscellaneous)

---

## Shortcuts, etc.

---

`Command-Shift-.` in the file browser shows hidden files(like `.bashrc`, etc.) 

---

Emoji for Mac keyboards: Use `CTRL + CMD + Space`

---

## Quarantine Attributes

---

[Remove the quarantine attribute](Selenium.md#remove-the-quarantine-attribute-from-chromedriver)

---

## Debugging

---

Issues with gdb and Eclipse.

https://www.thomasvitale.com/how-to-setup-gdb-and-eclipse-to-debug-c-files-on-macos-sierra/

https://apple.stackexchange.com/questions/309017/unknown-error-2-147-414-007-on-creating-certificate-with-certificate-assist

https://apple.stackexchange.com/questions/302866/keychain-access-error-when-creating-new-system-certificate

https://gist.github.com/hlissner/898b7dfc0a3b63824a70e15cd0180154

Another one, from some course.
https://www.ics.uci.edu/~pattis/common/handouts/macmingweclipse/allexperimental/mac-gdb-install.html
            
About codesign, etc.            
https://stackoverflow.com/questions/20875927/how-to-undo-codesign
    
```bash
    $ codesign -s gdb-cert gdb
```

To re-sign, you have to remove the signature first:

```bash
    $ codesign --remove-signature gdb
```

---

## Screen capture tools

---

Screenshot capture:
1. Click `Shift-Command-4`, or, I guess `Command-$`
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

## Miscellaneous

---

The docs about Mac's file types.
https://support.apple.com/guide/disk-utility/file-system-formats-available-in-disk-utility-dsku19ed921c/mac

Bottom line is that `APFS case-sensitive` is what you want.

---

Resetting the system management controller (SMC) can resolve certain
issues related to power, battery, and other features.
https://support.apple.com/en-us/HT201295

---

MacOS Security and Privacy Guide. Neat compilation of tricks and practices.
https://github.com/drduh/macOS-Security-and-Privacy-Guide

---

About getting appleid without credit cards:
https://appletoolbox.com/2016/01/how-to-create-an-apple-id-without-credit-card/
https://support.apple.com/en-us/HT204034

---

RDP client:
https://itunes.apple.com/us/app/microsoft-remote-desktop-10/id1295203466?mt=12

---

Automake tools on Mac:

```bash
    $ brew install automake
```

(At some point I needed autoreconf, this helped)

---

To add PATH on Mac
Simple way is to add PATH to file `~/.bash_profile`. Like so:

```bash
    export PATH="/usr/local/someprogramijustwrote/bin:$PATH"
```
---

to get `http`(the command line http client):

```bash
    $ brew install httpie
```

---

To get the number of CPUs
    
```bash
    $ sysctl hw.physicalcpu hw.logicalcpu
    hw.physicalcpu: 4
    hw.logicalcpu: 8
```

---