
## UNDER CONSTRUCTION

### Install

Git is part of XCode on Mac.

For Windows these options during installation worked ok:

    with Windows Command Line (no bash, no optional Unix tools)
    checkout as-is, commit as-is (that is "core.autocrlf" is set to "false")
    use MinTTY (the default terminal of MSYS2)
    emable file system caching ("core.fscache" is "true")
    enable git credential manager

Utility ```dos2unix``` was handy for those pesky ```"\r\n"``` .

There were some issues with the credentials on Cygwin.
