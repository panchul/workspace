[Home](Readme.md)
# screen

A terminal utility.

See Also:

  - [Linux](Linux.md)

---

**Contents**

- [Miscellaneous](Screen.md#miscellaneous)

---

## Miscellaneous

---

Start screen:

```bash
    $ screen
```

To detach press `Ctrl-A` and `d`.
To re-attach:

```bash
    $ screen -r
```

To see which sessions were saved:

```bash
    $ screen -ls
    1234 <timestamp> more info here
```

To pick one of them:

```bash
    $ screen -r 1234
```

---

More on `screen`:

https://www.tecmint.com/screen-command-examples-to-manage-linux-terminals/

---
