# Porter

Porter(a packaging tool), seems to be a nice community outreach example.

https://porter.sh/quickstart/

See Also:

 - [Homebrew](Homebrew.md)
 - [Aptitude](Aptitude.md)

---

**Contents**

- [Miscellaneous](Porter.md#miscellaneous)

---

## Miscellaneous

---

If you do not have Portal on your system, here is how you install it on Linux:

    $ curl https://cdn.porter.sh/latest/install-linux.sh | bash

On Windows:

    C:> iwr "https://cdn.porter.sh/latest/install-windows.ps1"

On Mac:

    $ curl https://cdn.porter.sh/latest/install-mac.sh | bash 

Verify it works:

    $ porter version
    porter v0.26.3-beta.1 (c0dc3415)

To create a template:

    $ porter create
    
To build(for Docker might need `sudo usermod -aG docker $USER`):

    $ porter build
    
To publish(might need `docker login`:

    $ porter publish
    
To run(if you have `install` in the .yaml):

    $ porter install demo --tag myuser/myimage:v0.1.0
    installing demo...
    
---