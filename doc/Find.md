[Home](Readme.md)
# Find

See also:

 - [Linux](Linux.md)
 - [Grep](Grep.md)
 - [Xargs](Xargs.md)

Standard Unix command.

---

**Contents**

- [Miscellaneous](Find.md#miscellaneous)

---

## Miscellaneous

---

Sample usage of `find` with `xargs`:
    
```bash
$ find . -name "*.txt" | xargs dos2unix
```

The quotation marks are important - may not work without them.

---

All .jpg and .png files, case insensitive

```bash
$ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
./somefilder/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000
```

See also [RegEx](RegEx.md)

---

Quick search and replace

```bash
$ find . -name "*.txt" -exec sed -i ".orig" 's/myfrom/myto/' +
````

On MacOS,  you might need to do something about the command, some special hoops to jump through:

```bash
$ find . -name "aa*.txt" -exec sed -i ".orig" 's/myto/myto2/' {} \;
```

---

Windows has an analog for `find`.

---
