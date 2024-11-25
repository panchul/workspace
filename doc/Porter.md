[Home](Readme.md)
# Porter

See Also:

 - [Homebrew](Homebrew.md)
 - [Aptitude](Aptitude.md)

Porter(a packaging tool), seems to be a nice community outreach example.

[https://porter.sh/quickstart/](https://porter.sh/quickstart/)

---

**Contents**


- [Installing](Porter.md#installing)
- [Creating and publishing a template](Porter.md#creating-and-publishing-a-template)
- [Miscellaneous](Porter.md#miscellaneous)

---

## Installing

---

If you do not have Portal on your system, here is how you install it on Linux:

```bash
    $ curl https://cdn.porter.sh/latest/install-linux.sh | bash
```

On Windows:

```PowerShell
    C:> iwr "https://cdn.porter.sh/latest/install-windows.ps1"
```

On Mac:

```bash
    $ curl https://cdn.porter.sh/latest/install-mac.sh | bash 
```

Verify it works:

```bash
    $ porter version
    porter v0.26.3-beta.1 (c0dc3415)
```

## Creating and publishing a template

To create a template:

```bash
    $ porter create
```

To build(for Docker might need `sudo usermod -aG docker $USER`):

```bash
    $ porter build
```

To publish(might need `docker login`:

```bash
    $ porter publish
```

To run(if you have `install` in the .yaml):

```bash
    $ porter install demo --tag myuser/myimage:v0.1.0
    installing demo...
```

---

## Miscellaneous

---
