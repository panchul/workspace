# xargs

`xargs` – construct argument list(s) and execute utility

    $ xargs [-0oprt] [-E eofstr] [-I replstr [-R replacements] [-S replsize]]
       [-J replstr] [-L number] [-n number [-x]] [-P maxprocs]
       [-s size] [utility [argument ...]]

See Also:

  - [Find](Find.md)
  - [Grep](Grep.md)

---

To count lines using `wc`

    $ find . -name '*.cpp' | xargs wc -l

---
