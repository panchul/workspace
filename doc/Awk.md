[Home](Readme.md)
# AWK

See Also:

  - [Sed](Sed.md)
  - [RegEx](RegEx.md)
  - [vi](Vim.md)

---

**Contents**

- [Miscellaneous](Awk.md#miscellaneous)

---

## Miscellaneous

---

Simple word manipulation demo.
 
Create file `pairs.txt`, put these in it:

```bash
    $ cat pairs.txt
    aaa bbb
    aaaa bbbb
```

Run simple awk command on it:

```bash
    $ awk '{print $2, $1}' pairs.txt 
    bbb aaa
    bbbb aaaa
```

---

Date formatting sample:

```bash
    $ date | awk '{print $1,$2,$3}'
    Tue 11 Sep
```

---
