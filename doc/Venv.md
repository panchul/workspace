[Home](Readme.md)
# venv

See also:

  - [Anaconda](Anaconda.md)
  - [Jupyter](Jupyter.md)
  - [Pip](Pip.md)

Python's virtual environments

My Python sandbox is [https://github.com/panchul/sb_python](https://github.com/panchul/sb_python).

---

**Content**

- [Installing](Venv.md#installing)
- [Creating and activating](Venv.md#creating-and-activating)
- [Miscellaneous](Venv.md#miscellaneous)

---

## Installing

```bash
    $ sudo apt install python3-venv
```

## Creating and activating

Then you can use virtual environments for the Python projects:

```bash
    $ python3 -m venv my_env
```

Then you can activate it like so:

```bash
    $ . my_env/bin/activate
    (my_env) $
```

It switched to this environment. Compare local and environment's versions:

```bash
    $ pip -V
    $ python -m pip list
```

To deactivate, run the script `deactivate`

```bash
    $ deactivate
    $ python -V
```

## Miscellaneous

---