

## UNDER CONSTRUCTION


# Bash

My shell sandbox is [https://github.com/panchul/sb_shell](https://github.com/panchul/sb_shell).

---

```
Command Description	Example
&	Run the previous command in the background	ls &
&&	Logical AND	                                if [ "$foo" -ge "0" ] && [ "$foo" -le "9"]
||	Logical OR	                                if [ "$foo" -lt "0" ] || [ "$foo" -gt "9" ] (not in Bourne shell)
^	Start of line	                            grep "^foo"
$	End of line	                                grep "foo$"
=	String equality (cf. -eq)	                if [ "$foo" = "bar" ]
!	Logical NOT	                                if [ "$foo" != "bar" ]
$$	PID of current shell	                    echo "my PID = $$"
$!	PID of last background command	            ls & echo "PID of ls = $!"
$?	exit status of last command	                ls ; echo "ls returned code $?"
$0	Name of current command (as called)	        echo "I am $0"
$1	Name of current command's first parameter	echo "My first argument is $1"
$9	Name of current command's ninth parameter	echo "My ninth argument is $9"
$@	All of current command's parameters (preserving whitespace and quoting)	    echo "My arguments are $@"
$*	All of current command's parameters (not preserving whitespace and quoting)	echo "My arguments are $*"
-eq	Numeric Equality	                        if [ "$foo" -eq "9" ]
-ne	Numeric Inquality	                        if [ "$foo" -ne "9" ]
-lt	Less Than	                                if [ "$foo" -lt "9" ]
-le	Less Than or Equal	                        if [ "$foo" -le "9" ]
-gt	Greater Than	                            if [ "$foo" -gt "9" ]
-ge	Greater Than or Equal	                    if [ "$foo" -ge "9" ]
-z	String is zero length	                    if [ -z "$foo" ]
-n	String is not zero length	                if [ -n "$foo" ]
-nt	Newer Than	                                if [ "$file1" -nt "$file2" ]
-d	Is a Directory	                            if [ -d /bin ]
-f	Is a File	                                if [ -f /bin/ls ]
-r	Is a readable file	                        if [ -r /bin/ls ]
-w	Is a writable file	                        if [ -w /bin/ls ]
-x	Is an executable file	                    if [ -x /bin/ls ]
( ... )	Function definition	                    function myfunc() { echo hello }
```

---

Here's how to get the nanosecond time('N' is nanoseconds) in bash:

    $ while true; do echo $(($(date "+%s%N")/1000000)); done;
 
 More at https://stackoverflow.com/questions/16548528/command-to-get-time-in-milliseconds

---

Idiomatic passing parameters in bash, flag ‘-e’ for echo and ‘@-‘ for curl:

    $ echo -e "[MYSETTING_1]\nsomeValue=123" | curl --data-binary @- http://128.0.0.1/myapi/consume

    OK
 
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

To get the return code from a command:

file.txt exists:

    $cat file.txt
    hello world
    echo $?
    0

In case of error:

    cat doesnotexist.txt
    cat: doesnotexist.txt: No such file or directory
    echo $?
    1

---

Simple finduser.sh script

```
#!/bin/bash
PASSWD_FILE=/etc/passwd

read -p "Enter a user name : " username

grep "^$username" $PASSWD_FILE > /dev/null

# if found grep will return 0 exit stauts
# if not found, grep will return a nonzero exit stauts
status=$?

if test $status -eq 0
then
	echo "User '$username' found in $PASSWD_FILE file."
else
	echo "User '$username' not found in $PASSWD_FILE file."
fi
```

---

User input is via ```read```:

    read myname
    echo "Welcome" $myname

---

Conditionals example. Reading two numbers from the input, printing their relationship.

    read X
    read Y

    if [ $X -gt $Y ]; then
      echo "X is greater than Y"
    else if [ $X -lt $Y ]; then
         echo "X is less than Y"
       else 
          echo "X is equal to Y"
       fi
    fi

---

Idiomatic check on configurations

    #!/bin/bash
    USERNAME=myuser
    HOSTS="1.2.3.4 1.2.3.5"
    SCRIPT="sudo cat /etc/docker/key.json"
    for HOSTNAME in ${HOSTS} ; do
        ssh -i mykeyname.pem ${USERNAME}@${HOSTNAME}  "${SCRIPT}"
    done

---

```set -e``` makes errors fatal for the script:
 
    #!/bin/bash
    cd /project1
    make
    if [[ $? -ne 0 ]] ; then
        exit 1
    fi

    cd /project2
    make
    if [[ $? -ne 0 ]] ; then
        exit 1
    fi

With set -e it would look like:

    #!/bin/bash
    set -e

    cd /project1
    make

    cd /project2
    make

---

Nice idiomatic error handling

    yell() { echo "$0: $*" >&2; }
    die() { yell "$*"; exit 111; }
    try() { "$@" || die "cannot $*"; }

So, it works like so:

    $ try() { "$@" || die "cannot $*"; } ; try date
    Tue Dec  4 16:56:44 EST 2018
    
    $ try() { "$@" || die "cannot $*"; } ; try echo $[2/0]
    -bash: 2/0: division by 0 (error token is "0")

Or, another simple idiom:
    
    echo $[1*2]
    echo $[2/0]              # division by 0 but execution of script proceeds
    echo $[3+3]
    (echo $[4/0]) || exit $? # script halted with code 1 returned from `echo`
    echo $[5+1]

--