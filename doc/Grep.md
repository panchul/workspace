[Home](Readme.md)
# grep

See Also:

 - [Find](Find.md)
 - [Linux](Linux.md)
 - [Xargs](Xargs.md)

---

**Contents**

- [Miscellaneous](Grep.md#miscellaneous)

---

## Miscellaneous

---

Apparently, Windows has an analog to grep, `findstr`, you can pipe to it too.

---

Neat summaries of bracket expressions

https://www.tecmint.com/linux-grep-commands-character-classes-bracket-expressions/

https://www.tecmint.com/12-practical-examples-of-linux-grep-command/


---

Something like this will filter out the lines starting with an alphanumeric:    

    $ grep "^[[:alnum:]]" tecmint.txt
    
Or just the letters:    
    
    $ grep "^[[:alpha:]]" tecmint.txt    

---

Count number of matches

    $ ifconfig | grep –c inet6

---

Print number of lines around matches

    $ ifconfig | grep –C 2 lo

---

To print line numbers:

    $ grep –n “main” setup..py
    
---
    
To search recursively in all directories

    $ grep –r "something" *
     
---

To print entire word:

    $ ifconfig | grep –w "RUNNING"
    
Will print things, while this one won't:
    
    $ ifconfig | grep –w "RUN"
    
---    

Searching in an archive:

    $ zgrep –i myword /var/log/syslog.2.gz

---

This is same as `grep -F`:

    $ fgrep –f file_full_of_patterns.txt file_to_search.txt

---