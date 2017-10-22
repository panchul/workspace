
# sed
See Also:
- [Awk](Awk.md)
- [RegEx](RegEx.md)

---

To add/remove carriage return, subset of ```dos2unix``` file convertion

To remove ( '-i' means edit files in place):

    $ sed -i 's/\r//' CRLF.txt

To add:

    $ sed -i 's/$/\r/' LF.txt

On MacOS, you need to provide the extention for the backup:

    $ sed -i ".orig" 's/myfrom/myto/' aaa.txt 

---

A quick search-and-replace, to use "<PATH_TO_CONFIG>" in the template file:

    $ sed "s|<PATH_TO_CONFIG>|$PATH_TO_CONFIG|g" config.template > config.for_realz
    
Here is another idiomatic command to make that config visible:

    $ export CONFIG_FOR_REALZ=$(pwd)/config.for_realz
    
---

