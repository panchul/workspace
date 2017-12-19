

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

For multiline content, this would work:

    sudo sh -c "cat >> /etc/hosts " << 'EOF'
    1.2.3.41  mydomain1.com  
    1.2.3.42  mydomain2.com  
    1.2.3.43  mydomain3.com  
    EOF

B.t.w. if you want to have parameters in that body, use EOF without quotes:

    sudo sh -c "cat > /var/www/html/index.html " << EOF
      <html>
      <body>
      "${HTTP_CONTENT}"
      </body>
      </html>
    EOF

---

## Unit testing of bash scripts

I forked shunit2: https://github.com/panchul/shunit2

There is another similar framework at https://github.com/djui/bashunit

And this project has interesting usage if it: https://github.com/atmoz/sftp


---

Sample usage of xargs:
    
    $ find . -name "*.txt" | xargs dos2unix

---

Speaking of ```find```, I used to have my envelope for it 
('''-l''' for grep is to output only filenames, sometimes used '''-i''' to ignore case)


    $ find . \( \
       \( -path "*.snapshot*" -prune \) \
    -o \( -path "*..*" -prune \) \
    -o \( -path "*/o.sun*" -prune \) \
    \) \
    -o \
    -not -type d  \
    -not -iname "*.r" \
    -not -iname "*.i" \
    -not -iname "s.*" \
    -not -iname "*.class" \
    -not -iname "*.gz" \
    -not -iname "*.java" \
    -not -iname "*.jar" \
    -not -iname "*.o" \
    -not -iname "*.a" \
    -not -iname "*.so" \
    -not -iname "*.DLL" \
    -not -iname "*.tar*" \
    -not -iname "*.tgz*" \
    -not -iname "*.Z"  \
    -not -iname "*.old*" \
    -not -iname "*.log" \
    -not -iname "*.db" \
    -not -iname "*.gif" \
    -not -iname "*.zip"  \
    -not -iname "*.sql"  \
    -exec grep -l "$1" {} \; 2> /dev/null

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

Command to restart Docker services

    for SVC in $(docker service ls | grep ' 0/' | awk '{print $2}'); do \
    docker service update --force $SVC; done

How to rewrite it using sudo, this snippet might be helpful:

    $ sudo bash -v -c "for dcyml in \$(ls -1 *.sh) ; do echo \$dcyml ; done"
 
```-v``` is just for verbosity. 
 
---

I used this to time an operation:

    $ MYSTART=$(date +%s) ; for i in `seq 1 10` ; do echo -n $i ; done ; MYEND=$(date +%s) ; echo Time it took: $(($MYEND - $MYSTART))

Something like this would work too:

    $ now=$(date +%s)sec ; while true; do printf "%s\r" $(TZ=UTC date --date now-$now +%H:%M:%S.%N) ;  done
    00:00:06.963877203

---

Using included files in scripts. Let's say we have ```incl.sh``` and we want its content to be used in ```main.sh```

Included:

    #!/bin/bash
    echo "The included script"

Main:

    #!/bin/bash
    source $(dirname $0)/incl.sh
    echo "The main script"

Nice discussion on this subject is here: https://stackoverflow.com/questions/192292/bash-how-best-to-include-other-scripts

---

Neat bash trick:

    $ function debug() {((DEBUG_LOG)) && echo "### $*"; }
    $ debug "something"
    $ DEBUG_LOG=1 debug "something"
    ### something
    $ debug "something"
    $ export DEBUG_LOG=1
    $ debug "something"
    ### something

---

First letter of a variable:

    $ word=something ; echo ${word::1}
    s

Or

    $ word=something ; echo $(echo $word | head -c 1)
    
---

Skipping the commented lines in an input file

    #!/bin/bash
    # $1 has the filename
    
    while IFS='' read -r line || [[ -n "$line" ]]; do 
        if [[ -n "$line" ]] ; then
           if [[ "$(echo $line | head -c 1)" != "#" ]] ; then
               echo "next line from file: \"${line}\""
           fi
        fi
    done < "$1"    
    
    
---

A lot of nice tricks on advanced Bash with functions, and dereferencing variables, etc.:

http://tldp.org/LDP/abs/html/complexfunct.html


---

Example of using ```<<<``` and ```read```

    $ cat /tmp/ifs.sh
    LINE="7.6.5.4"
    IFS='.'  read -a ARRAY <<< "$LINE"
    echo "$IFS"
    echo "${ARRAY[@]}"
    
    $ bash /tmp/ifs.sh 
    
    7 6 5 4
    
By the way, a typo can cause different result:
    
    $ cat /tmp/ifs.sh 
    LINE="7.6.5.4"
    IFS='.';  read -a ARRAY <<< "$LINE"
    echo "$IFS"
    echo "${ARRAY[@]}"
    
    $ bash /tmp/ifs.sh 
    .
    7 6 5 4

---

Quick script to append the line numbers and possibly offset.

    #!/usr/bin/env bash
    
    if [[ -n "$2" ]] ; then
      MYCOUNTER=$(($2))
    else
      MYCOUNTER=0
    fi
    
    cat $1 | \
        while IFS='' read -r line || [[ -n "$line" ]]; do 
            if [[ -n "$line" ]] ; then
                echo $MYCOUNTER $line
                MYCOUNTER=$(($MYCOUNTER+1))
            fi
        done 
    
---    
