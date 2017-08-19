

## UNDER CONSTRUCTION


# Bash

My shell sandbox is [https://github.com/panchul/sb_shell](https://github.com/panchul/sb_shell).

---

A collection of snippets
http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html#toc7

---

To run a stdout redirect in a sudo line, this helped:

    sudo sh -c "echo $1 > /tmp/myserver$1/myid "

Without "sh -c" did not work:

    sudo echo $1 > /tmp/zookeeper$1/myid         <----- is not allowed.

Similar thing is going on with Dockerfile's CMD and Entrypoint

---

## Unit testing of bash scripts

I forked shunit2: https://github.com/panchul/shunit2

There is another similar framework at https://github.com/djui/bashunit

And this project has interesting usage if it: https://github.com/atmoz/sftp


---

Sample usage of xargs:
    
    $ find . -name "*.txt" | xargs dos2unix

---

A quick search-and-replace, to use "<PATH_TO_CONFIG>" in the template file:

    $ sed "s|<PATH_TO_CONFIG>|$PATH_TO_CONFIG|g" config.template > config.for_realz

See [Sed.md](Sed.md) for more.
Here is another idiomatic command to make that config visible:

    $ export CONFIG_FOR_REALZ=$(pwd)/config.for_realz
    
---

Quick example of ```for``` loop

    $ for i in $( ls ); do echo item: $i; done

Or, in a file,

     #!/bin/bash
     for i in $( ls ); do
         echo item: $i
     done

---

Idiomatic ```while``` loop

    #!/bin/bash 
    COUNTER=0
    while [  $COUNTER -lt 10 ]; do
         echo The counter is $COUNTER
         let COUNTER=COUNTER+1 
    done
    
similar thing with ```until```

    #!/bin/bash 
    COUNTER=10
    until [  $COUNTER -lt 5 ]; do
         echo COUNTER $COUNTER
         let COUNTER-=1
    done
    
---

use ```echo -e "something\n the other line"``` to get multi-line strings

https://stackoverflow.com/questions/3005963/how-can-i-have-a-newline-in-a-string-in-sh

---