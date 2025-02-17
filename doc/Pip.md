[Home](Readme.md)
# pip

See Also:

 - [Anaconda](Anaconda.md)
 - [Python](Python.md)

---

**Content**

- [Installing](Pip.md#installing)
- [Installing a package](Pip.md#installing-a-package)
- [Creating an environment](Pip.md#Creating-an-environmtn)
- [Requirements.txt format](Pip.md#Requirements-txt-format)
- [Miscellaneous](Pip.md#Miscellaneous)

---

## Installing

---

On Ubuntu:

```bash
    $ sudo apt install python3-pip 
```

---

To see if pip is present:

```bash
    $ pip -V
    pip 21.1.2 from /Users/lib/python3.7/site-packages/pip (python 3.7)
```

---

For older versions, you can use http://pip-installer.org

The packages are usually fetched from the repository https://pypi.org

---

## Installing a package

---

Basic usage:

```bash
    $ pip install <somempackage>
```

Or, indirectly (because environment may have other things):

```bash
    $ python -m pip install <somempackage>
```

---

To make a snapshot into `requirements.txt`:

```bash
    (my_env)$ python -m pip freeze > requirements.txt
```

To use a requirements.txt file in a new environment:

```bash
    $ python -m pip install -r requirements.txt
```

---

## Creating an environment

Using [`venv`](Venv.md)

---

To create:

```bash
    $ python3 -m venv myenv
```

To activate:

```bash
    $ . ~/virtualenvs/my_env/bin/activate
```

To make a snapshot into `requirements.txt`:

```bash
    (my_env)$ python -m pip freeze > requirements.txt
```

To use a requirements.txt file in a new environment:

```bash
    $ python -m pip install -r requirements.txt
```

It will install all what's in requirements.

---

## Requirements.txt format

---

You can use `==`, `>=`, `!=`, etc.:

```bash
    docopt = 0.1.1      # must be 0.1.1
    something >= 1.2.3  # minimum - 1.2.3
    anotherone != 3.2   # anything except 3.2
```

You can use same semantics for pip, e.g. `python -m pip install myupackage==0.1.2` 

---

## Miscellaneous

---

A good way to use pip is to run it via python's paths, etc. So the version
of the python itself could look up the pip which will properly place the packages:

```bash
    $ python -m pip install -U mypackage
```

`-U` is to upgrade at the same time.

And you can specify the user, to make it user-specific:

```bash
    $ python -p install --user mypackagename
```

---

```bash
    $ sudo -H pip install --ignore-installed six
```

---

To see all packages:

```bash
    $ pip freeze
```

---    

To see where the packages are installed, run `import sys` in python command line:

```bash
    $ python
    ...
    >>> import sys
    >>> sys.path
    ['','/usr/lib/python2.7',
    ......]
```

---

To see the info about package 'package_name':

```bash
    $ pip show package_name
```

---
