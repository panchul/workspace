# Windows

---

Slow and boring, but maybe will help somebody.
A guy shows a way to share filew using network cable.
https://www.youtube.com/watch?v=XoKfUXVD1d8

---

Security policies could be changed with `secpol.msc`, which is in C:\Windows\system32

---

Neat snippet about using console i/o for a win32 gui application in C++
http://dslweb.nwnexus.com/~ast/dload/guicon.htm

---

How to generate an exit code, and how to print it to the terminal:

    C:\tmp>cmd /c exit 123
    C:\tmp>echo %ERRORLEVEL%
    123

---

Open-source UI Automation library

    https://github.com/TestStack/White

---

To get the base folder of the script being executed:

    set SCRIPT_DIR=%~dp0
    echo %SCRIPT_DIR:~0,-1%

`:~n,m` syntax, removes the final backslash.  
More on batch paramaters:

https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/call#batch-parameters

---
