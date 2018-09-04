
# Vi/Vim

---

[http://www.vim.org/download.php](http://www.vim.org/download.php)  

---

On some distributions of Linux the keys are messed up.

Add this to ```~/.vimrc``` to make sure the arrows work as expected:

```set esckeys```

I think this works too:

```set nocp```

---

This turns on the line numbers, in ```~/.vimrc```:

```set number```

To turn them off, '''set nonumber``` 

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

Keys

    h   move one character left
    j   move one row down
    k   move one row up
    l   move one character right
    w   move to beginning of next word
    b   move to previous beginning of word
    e   move to end of word
    W   move to beginning of next word after a whitespace
    B   move to beginning of previous word before a whitespace
    E   move to end of word before a whitespace

All the above movements can be preceded by a count; e.g. 4j moves down 4 lines.

    0   move to beginning of line
    $   move to end of line
    _   move to first non-blank character of the line
    g_  move to last non-blank character of the line
    
    gg  move to first line
    G   move to last line
    nG  move to n'th line of file (n is a number; 12G moves to line 12)
    
    H   move to top of screen
    M   move to middle of screen
    L   move to bottom of screen
    
    zz  scroll the line with the cursor to the center of the screen
    zt  scroll the line with the cursor to the top
    zb  scroll the line with the cursor to the bottom

    Ctrl-d  move half-page down
    Ctrl-u  move half-page up
    Ctrl-b  page up
    Ctrl-f  page down
    Ctrl-O  jump to last (older) cursor position
    Ctrl-I  jump to next cursor position (after Ctrl-O)
    Ctrl-Y  move view pane up
    Ctrl-E  move view pane down

    n   next matching search pattern
    N   previous matching search pattern
    *   next whole word under cursor
    #   previous whole word under cursor
    g*  next matching search (not whole word) pattern under cursor
    g#  previous matching search (not whole word) pattern under cursor

    %   jump to matching bracket { } [ ] ( )

    fX  to next 'X' after cursor, in the same line (X is any character)
    FX  to previous 'X' before cursor (f and F put the cursor on X)
    tX  til next 'X' (similar to above, but cursor is before X)
    TX  til previous 'X'
    ;   repeat above, in same direction
    ,   repeat above, in reverse direction

    d$  will delete from the current cursor position to the end of the current line.
    D   is a synonym for d$ (delete till end of the line)
    
    
See :help {command} (for example, :help g_) for all of the above if you want more details. 


---

Using Vim as a Hexadecimal editor:
    
1. Open the file in Vim.
2. Run the command ```:% ! xxd```
3. Edit.
4. Once done, run ```:% ! xxd -r```
5. Save.

---

Change the line endings in the vi:

    :e ++ff=dos
    :e ++ff=mac
    :e ++ff=unix

This can also be used as saving operation (:w alone will not save using the lineendings you see on screen):

    :w ++ff=dos
    :w ++ff=mac
    :w ++ff=unix

And you can use it from the command-line:

    for file in $(ls *.txt)
    do 
      vi +":w ++ff=unix" +":q" ${file}
    done

--
