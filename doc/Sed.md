[Home](Readme.md)
# sed

See Also:

  - [Awk](Awk.md)
  - [RegEx](RegEx.md)

---

To add/remove carriage return, subset of `dos2unix` file convertion

To remove ( '-i' means edit files in place):

```bash
    $ sed -i 's/\r//' CRLF.txt
```

To add:

```bash
    $ sed -i 's/$/\r/' LF.txt
```

On MacOS, you need to provide the extention for the backup:

```bash
    $ sed -i ".orig" 's/myfrom/myto/' aaa.txt 
```

---

Basic usage, as a regex:

```bash
    $ sed 's/Unix/Linux' somefile.txt > the_output_file.txt
```

---

A quick search-and-replace, to use `<PATH_TO_CONFIG>` in the template file:

```bash
    $ sed "s|<PATH_TO_CONFIG>|$PATH_TO_CONFIG|g" config.template > config.for_realz
```

Here is another idiomatic command to make that config visible:

```bash
    $ export CONFIG_FOR_REALZ=$(pwd)/config.for_realz
```
    
---
