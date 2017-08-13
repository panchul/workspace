
## UNDER CONSTRUCTION

# Vi/Vim

---

[http://www.vim.org/download.php](http://www.vim.org/download.php)  

---

### On some distributions of Linux the keys are messed up.

Add this to ```~/.vimrc``` to make sure the arrows work as expected:

```
set esckeys
```

I think this works too:

```
set nocp
```

---

This turns on the line numbers, in ```~/.vimrc```:

```
set number
```

---

Bottom line, just cut and paste this to ```~/.vimrc```:

```
set esckeys
set tabstop=4
set number
```

---

Finding and replacing a text in entire test:

    :%s/pattern1/replacement/

---
