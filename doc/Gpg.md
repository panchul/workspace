[Home](Readme.md)
# GPG

https://gnupg.org/

---

To install:

```bash
    $ sudo apt-get install gnupg
```

To encrypt:

```bash
    $ gpg -c filename
```

To decrypt:

```bash
    $ gpg filename.gpg
```

Or, to specify the output file

```bash
    $ gpg -d filename.gpg --output anotherfilename
```

To pipe it via tar:

```bash
    $ tar -cz /path/to/dir/ | gpg -c -o your_file.tgz.gpg
    $ gpg -d your_file.tgz.gpg | tar xz
```

Using public keys:

```bash
    $ gpg --output outFileName.gpg --encrypt --recipient someuser@somedomain.com inputFileName.txt
```

The encrypted document can only be decrypted by someone with a private key that complements one of the recipients’ public keys.

```bash
    $ gpg --output inputFileName.txt --decrypt outFileName.gpg   
```
    
---

GnuPG handbook:
https://www.gnupg.org/gph/en/manual/x135.html

---

How to verify software packages with GPG signatures (Linux + Mac OS X)
https://www.youtube.com/watch?v=I_76X8Znadc

---
