
## UNDER CONSTRUCTION


### On Windows

There are times when you could use it on Windows. Here's how to get it:
[http://www.vim.org/download.php](http://www.vim.org/download.php)  

You'll need to add the path to it.


### On Linux

Add this to ```~/.vimrc``` to make sure the arrows work as expected:

```
set esckeys
```

I think this works too:

```
set nocp
```

This turns on the line numbers:

```
set number
```


Bottom line, just cut and paste this:

```
set esckeys
set tabstop=4
set number
```

