# GDB

See Also:

  - [MacOS](MacOS.md)
  - [Linux](Linux.md)
  - [C++](CPP.md)

---

    $ sudo apt install gdb
    
---

    $ brew install gdb

About code signing:
https://sourceware.org/gdb/wiki/BuildingOnDarwin

Did not work on Mojave.
https://stackoverflow.com/questions/48567543/unknown-error-creating-a-certificate

And that's not all
https://stackoverflow.com/questions/20875927/how-to-undo-codesign

To undo this:

    $ codesign -s gdb-cert gdb

Use this:

    $ codesign --remove-signature gdb

Better yet, use '-f' to force replacement of a certificate.

And even more:

https://stackoverflow.com/questions/52699661/macos-mojave-how-to-achieve-codesign-to-enable-debugging-gdb


```
...
you must change codesign -fs gdbcert /usr/local/bin/gdb to codesign --entitlements gdb.xml -fs gdbcert /usr/local/bin/gdb .

gdb.xml content must something like following code.

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>com.apple.security.cs.debugger</key>
    <true/>
</dict>
</plist>

```

More of the gdb bs:
https://stackoverflow.com/questions/21082234/mac-c-eclipse-cannot-debug-error-while-launching-command-gdb-version


Nice review of all of the above:
https://www.youtube.com/watch?v=JdcpDOf5Sog

---

Another about code-sign gdb:

https://www.ics.uci.edu/~pattis/common/handouts/macmingweclipse/allexperimental/mac-gdb-install.html

---