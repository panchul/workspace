[Home](Readme.md)
# Bash

See Also:
     
  - [cron](Cron.md)
  - [Curl](Curl.md)
  - [Ipvsadm](Ipvsadm.md)
  - [Linux](Linux.md)
  - [tar](Tar.md)
  - [tcpdump](Tcpdump.md)
  - [nohup](Nohup.md)
  - [mail](Mail.md)

My shell sandbox is [https://github.com/panchul/sb_shell](https://github.com/panchul/sb_shell).

---

**Contents**

- [Control flow](Bash.md#control-flow)
- [Miscellaneous](Bash.md#miscellaneous)

---

## Control flow

---

Add `set -Eeuo pipefail` in the beginning to let it fail if there is error in commands.

In addition to set -e, also do set -u (or set -eu). -u puts an end to the idiotic, bug-hiding behavior that you can access any nonexistent variable and have a blank value produced with no diagnostics.
Unofficial Bash Strict Mode: redsymbol.net/articles/unofficial-bash-strict-mode

https://stackoverflow.com/questions/821396/aborting-a-shell-script-if-any-command-returns-a-non-zero-value

---

## Miscellaneous

---

Neat review of setting variables with simple demos.
https://www.cyberciti.biz/faq/set-environment-variable-linux/

---

Useful shortcuts, a longer discussion is here: https://stackoverflow.com/questions/9679776/how-do-i-clear-delete-the-current-line-in-terminal 

You can enable vi mode by `echo 'set editing-mode vi' >> ~/.inputrc` too if it is better.

```
    Ctrl+a Move cursor to start of line
    Ctrl+e Move cursor to end of line
    Ctrl+b Move back one character
    Alt+b Move back one word
    Ctrl+f Move forward one character
    Alt+f Move forward one word
    Ctrl+d Delete current character
    Ctrl+w Cut the last word
    Ctrl+k Cut everything after the cursor
    Alt+d Cut word after the cursor
    Alt+w Cut word before the cursor
    Ctrl+y Paste the last deleted command
    Ctrl+_ Undo
    Ctrl+u Cut everything before the cursor
    Ctrl+xx Toggle between first and current position
    Ctrl+l Clear the terminal
    Ctrl+c Cancel the command
    Ctrl+r Search command in history - type the search term
    Ctrl+j End the search at current history entry
    Ctrl+g Cancel the search and restore original line
    Ctrl+n Next command from the History
    Ctrl+p previous command from the History
```

---

Simple way to make multi-line comments is to use operator `:` :

```bash
    #!/bin/bash
    something=somethingelse
    : '
    here goes a multi-line comment
    another line
    more
    '
    echo "hi htere"
```

Command `:` has no effect. The command does nothing beyond expanding
arguments and performing andy specified redirections. A zero exit code is returned.    

---

To change shell, to, for example, `zsh`:

    $ chsh -s /bin/zsh

---

```bash
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

Idiomatic passing parameters in bash, flag `-e` for echo and `@-` for curl(`@` meanst file):

```bash
    $ echo -e "[MYSETTING_1]\nsomeValue=123" | curl --data-binary @- http://128.0.0.1/myapi/consume
    OK
```

Or from a file:

```bash
    $ curl --data-binary @filename https://example.com
```

See more in [Curl.md](Curl.md)
 
---

A collection of snippets

http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html#toc7

---

To run a stdout redirect in a sudo line, this helped:

```bash
    $ sudo sh -c "echo $1 > /tmp/myserver$1/myid "
```

Without "sh -c" did not work:

```bash
    $ sudo echo $1 > /tmp/zookeeper$1/myid         <----- is not allowed.
```

Similar thing is going on with Dockerfile's CMD and Entrypoint

For multiline content, this would work:

```bash
    $ sudo sh -c "cat >> /etc/hosts " << 'EOF'
    1.2.3.41  mydomain1.com  
    1.2.3.42  mydomain2.com  
    1.2.3.43  mydomain3.com  
    EOF
```

B.t.w. if you want to have parameters in that body, use EOF without quotes:

```bash
    $ sudo sh -c "cat > /var/www/html/index.html " << EOF
      <html>
      <body>
      "${HTTP_CONTENT}"
      </body>
      </html>
    EOF
```

---

Unit testing of bash scripts

I forked shunit2: https://github.com/panchul/shunit2

There is another similar framework at https://github.com/djui/bashunit

And this project has interesting usage if it: https://github.com/atmoz/sftp

---

Sample usage of xargs:
    
    $ find . -name "*.txt" | xargs dos2unix

---

Speaking of `find`, I used to have my envelope for it 
(`-l` for grep is to output only filenames, sometimes used `-i` to ignore case)


```bash
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
```

---

A quick search-and-replace, to use `<PATH_TO_CONFIG>` in the template file:

```bash
    $ sed "s|<PATH_TO_CONFIG>|$PATH_TO_CONFIG|g" config.template > config.for_realz
```

See [Sed.md](Sed.md) for more.

Here is another idiomatic command to make that config visible:

```bash
    $ export CONFIG_FOR_REALZ=$(pwd)/config.for_realz
```    
---

Quick example of `for` loop

```bash
    $ for i in $( ls ); do echo item: $i; done
```

Or, in a file,

```bash
     #!/bin/bash
     for i in $( ls ); do
         echo item: $i
     done
```

---

Idiomatic `while` loop

```bash
    #!/bin/bash 
    COUNTER=0
    while [  $COUNTER -lt 10 ]; do
         echo The counter is $COUNTER
         let COUNTER=COUNTER+1 
    done
```

similar thing with `until`

```bash
    #!/bin/bash 
    COUNTER=10
    until [  $COUNTER -lt 5 ]; do
         echo COUNTER $COUNTER
         let COUNTER-=1
    done
```    
---

use `echo -e "something\n the other line"` to get multi-line strings

https://stackoverflow.com/questions/3005963/how-can-i-have-a-newline-in-a-string-in-sh

---

Command to restart Docker services

```bash
    for SVC in $(docker service ls | grep ' 0/' | awk '{print $2}'); do \
    docker service update --force $SVC; done
```

How to rewrite it using sudo, this snippet might be helpful:

```bash
    $ sudo bash -v -c "for dcyml in \$(ls -1 *.sh) ; do echo \$dcyml ; done"
``` 
`-v` is just for verbosity. 
 
---

I used this to time an operation:

```bash
    $ MYSTART=$(date +%s) ; for i in `seq 1 10` ; do echo -n $i ; done ; MYEND=$(date +%s) ; echo Time it took: $(($MYEND - $MYSTART))
```

Something like this would work too:

```bash
    $ now=$(date +%s)sec ; while true; do printf "%s\r" $(TZ=UTC date --date now-$now +%H:%M:%S.%N) ;  done
    00:00:06.963877203
```
---

Using included files in scripts. Let's say we have `incl.sh` and we want its content to be used in `main.sh`

Included:

```bash
    #!/bin/bash
    echo "The included script"
```
Main:

```bash
    #!/bin/bash
    source $(dirname $0)/incl.sh
    echo "The main script"
```

Nice discussion on this subject is here: https://stackoverflow.com/questions/192292/bash-how-best-to-include-other-scripts

---

Neat bash trick:

```bash
    $ function debug() {((DEBUG_LOG)) && echo "### $*"; }
    $ debug "something"
    $ DEBUG_LOG=1 debug "something"
    ### something
    $ debug "something"
    $ export DEBUG_LOG=1
    $ debug "something"
    ### something
```
---

First letter of a variable:

```bash
    $ word=something ; echo ${word::1}
    s
```
Or

```bash
    $ word=something ; echo $(echo $word | head -c 1)
```    
---

Skipping the commented lines in an input file

```bash
    #!/bin/bash
    # $1 has the filename
    
    while IFS='' read -r line || [[ -n "$line" ]]; do 
        if [[ -n "$line" ]] ; then
           if [[ "$(echo $line | head -c 1)" != "#" ]] ; then
               echo "next line from file: \"${line}\""
           fi
        fi
    done < "$1"    
```    
    
---

A lot of nice tricks on advanced Bash with functions, and dereferencing variables, etc.:

http://tldp.org/LDP/abs/html/complexfunct.html


---

Example of using `<<<` and `read`

```bash
    $ cat /tmp/ifs.sh
    LINE="7.6.5.4"
    IFS='.'  read -a ARRAY <<< "$LINE"
    echo "$IFS"
    echo "${ARRAY[@]}"
    
    $ bash /tmp/ifs.sh 
    
    7 6 5 4
```    
By the way, a typo can cause different result:
    
```bash
    $ cat /tmp/ifs.sh 
    LINE="7.6.5.4"
    IFS='.';  read -a ARRAY <<< "$LINE"
    echo "$IFS"
    echo "${ARRAY[@]}"
    
    $ bash /tmp/ifs.sh 
    .
    7 6 5 4
```
---

Quick script to append the line numbers and possibly offset.

```bash
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
```    
---    

To get the return code from a command:

file.txt exists:

```bash
    $cat file.txt
    hello world
    echo $?
    0
```
In case of error:

```bash
    cat doesnotexist.txt
    cat: doesnotexist.txt: No such file or directory
    echo $?
    1
```
---

Simple finduser.sh script

```bash
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

User input is via `read`:

```bash
    read myname
    echo "Welcome" $myname
```
---

Conditionals example. Reading two numbers from the input, printing their relationship.

```bash
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
```
---

Idiomatic check on configurations

```bash
    #!/bin/bash
    USERNAME=myuser
    HOSTS="1.2.3.4 1.2.3.5"
    SCRIPT="sudo cat /etc/docker/key.json"
    for HOSTNAME in ${HOSTS} ; do
        ssh -i mykeyname.pem ${USERNAME}@${HOSTNAME}  "${SCRIPT}"
    done
```
---

`set -e` makes errors fatal for the script:
 
```bash
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
```
With set -e it would look like:

```bash
    #!/bin/bash
    set -e

    cd /project1
    make

    cd /project2
    make
```
---

Nice idiomatic error handling

```bash
    yell() { echo "$0: $*" >&2; }
    die() { yell "$*"; exit 111; }
    try() { "$@" || die "cannot $*"; }
```
So, it works like so:

```bash
    $ try() { "$@" || die "cannot $*"; } ; try date
    Tue Dec  4 16:56:44 EST 2018
    
    $ try() { "$@" || die "cannot $*"; } ; try echo $[2/0]
    -bash: 2/0: division by 0 (error token is "0")
```
Or, another simple idiom:
    
```bash
    echo $[1*2]
    echo $[2/0]              # division by 0 but execution of script proceeds
    echo $[3+3]
    (echo $[4/0]) || exit $? # script halted with code 1 returned from `echo`
    echo $[5+1]
```
---

pushd popd example

```bash
    ~$ mkdir navigate
    ~/navigate$ mkdir dir1
    ~/navigate$ mkdir dir2
    ~/navigate$ mkdir dir3
```
adding all to the stack:

```bash
    ~/navigate$ pushd dir1/
    ~/navigate/dir1 ~/navigate
    ~/navigate/dir1$ pushd ../dir2/
    ~/navigate/dir2 ~/navigate/dir1 ~/navigate
    ~/navigate/dir2$ pushd ../dir3/
    ~/navigate/dir3 ~/navigate/dir2 ~/navigate/dir1 ~/navigate
```
looking up:

```bash
    ~/navigate/dir3$ dirs -v
     0  ~/navigate/dir3
     1  ~/navigate/dir2
     2  ~/navigate/dir1
     3  ~/navigate
```
To navigate safely, you need to add the last (zero) folder twice, since it will be always rewritten:

```bash
    ~/navigate/dir3$ pushd .
    ~/navigate/dir3$ dirs -v
     0  ~/navigate/dir3
     1  ~/navigate/dir3
     2  ~/navigate/dir2
     3  ~/navigate/dir1
     4  ~/navigate


    ~/navigate/dir3$ cd ~4
    ~/navigate$ dirs -v
     0  ~/navigate
     1  ~/navigate/dir3
     2  ~/navigate/dir2
     3  ~/navigate/dir1
     4  ~/navigate
    ~/navigate$ cd ~3
    ~/navigate/dir1$ dirs -v
     0  ~/navigate/dir1
     1  ~/navigate/dir3
     2  ~/navigate/dir2
     3  ~/navigate/dir1
     4  ~/navigate
    ~/navigate/dir1$ touch text.txt
    ~/navigate/dir1$ cp text.txt ~2
    ~/navigate/dir1$ ls ~2
    text.txt
    ~/navigate/dir1$ dirs -v
     0  ~/navigate/dir1
     1  ~/navigate/dir3
     2  ~/navigate/dir2
     3  ~/navigate/dir1
     4  ~/navigate    
```
---

I used to have these macros in .bashrc all the time:

```bash
    # Source global definitions
    if [ -f /etc/bashrc ]; then
	    . /etc/bashrc
    fi

    export PS1="\t \u@\h: \w\n>"
    alias ll='ls -la'
    #alias ll='ls -l --color=tty'
```

in `.profile` to make normal Back Space:

```bash
    stty erase ^H
```
---

About bitwise and:

```bash
    $ echo $(( 2 & 3 )) # 00000010 AND 00000011 = 00000010
    2

    $ echo $(( 120 & 97 )) # 01111000 AND 01100001 = 01100000
    96
```
The same with OR (|):

```bash
    $ echo $(( 2 | 3 )) # 00000010 OR 00000011 = 00000011
    3

    $ echo $(( 120 | 97 )) # 01111000 OR 01100001 = 01111001
    121


    $ bc <<< "obase=2; 97"
    1100001
```

will convert 97 to binary (the o in obase stands for output), and ...

```bash
    $ bc <<< "ibase=2; 11001011"
    203
```
---

Using bc to calculate things a() is arctangent

```bash
    $ pi=$(echo "scale=10; 4*a(1)" | bc -l)
```
---

Examples of using {}, brace expansion:
    
```bash
    $ echo file.txt{,.bak}
    file.txt file.bak
    
    $ echo file-{a..d}.txt
    file-a.txt file-b.txt file-c.txt file-d.txt
```

and so on:
    
```bash
    $ mkdir -p /apache-jail/{usr,bin,lib64,dev}
    $ cp httpd.conf{,.backup}
    $ mv delta.{txt,doc}
```

update all CentOS/RHEL boxes named with the pattern: 

```bash
    for server in aws-{prod,backup-prod}-{db,www}-0{1..4}
    do
        ssh -t myusername@${server} sudo -- sh -c 'yum update'
    done
```
---

To fix the display from non-text garbage:

```bash
    $ reset
```
or
    
```bash
    $ tput reset
```
if that failed, try resetting stty session like so:

```bash
    $ stty sane
```
Press Ctrl+L should work too, or command:

```bash
    $ clear
```
ANSI escape sequence can clear the bash terminal too:

```bash
    $ clear
    $ echo -e "\033c"
```
---

Sometimes a command with pattern has an error "Argument list too long"
Here are some work-arounds.

Using `xargs`:

```bash
    $ find . -name "*tmp" -print | xargs rm -f
```
Or simply:

```bash
    $ find . -name "*tmp" -exec rm -f {} \;
```
or

```bash
    $ find . -type f -name "*tmp" -exec rm -f {} \;
```
---

Option `-J` will do the string replacement, effectively moving the
argument from the end of the command to wherever.

```bash
    $ /bin/ls -1d [A-Z]* | xargs -J % cp -rp % destdir
```    
---

```bash
    var="This is a test"
    echo "${var~~}" # Reverse var #
    echo "${var^^}" # UPPERCASE var #
    echo "${var,,}" # lowercase var #
```
---

Idiomatic alias for `sudo`ing multiple commands:

```bash
    alias update="sudo sh -c 'apt update && apt upgrade -y'"
```
Other alternatives:

```bash
    $ sudo sh -c 'command1 && command2'
    $ sudo -- sh -c 'command1 && command2'
    $ sudo -u userNameHere -- sh -c 'command1; command2'
    $ sudo -- sh -c 'command1; command2'
    $ sudo -- bash -c 'command1; command2'
    $ sudo -i -- 'command1; command2; command3'
    $ sudo -i -- sh -c 'command1 && command2 && command3'
```
Sample of how to use one sudo for several commands in a script

```bash
    #!/bin/bash
    echo "Running commands as a root user..."
    sudo -- -sh -c <<EOF
    apt-get update
    apt-get -y upgrade
    apt-get -y install nginx 
    apt-get -y remove nano
    apt-get clean
    echo "All done."
    EOF
```
---

Discussion about how bash logical operands are screwed up.
https://stackoverflow.com/questions/7656425/makefile-ifeq-logical-or

---

How to count lines of .cpp and .h files in the current directory and its subdirectories.

```bash
    $ find . -type f \( -name "*.h" -or -name "*.cpp" \) -exec wc -l {} \; | awk '{total += $1} END{print total}'
```
A longer discussion on that: https://unix.stackexchange.com/questions/260630/how-do-you-list-number-of-lines-of-every-file-in-a-directory-in-human-readable-f 

---

Interesting usage of `!!` in bash:
https://www.tecmint.com/mysterious-uses-of-symbol-or-operator-in-linux-commands/
TODO: make summary

---

You can edit remote files via scp:

```bash
    $ vim scp://box-1//path/to/file
    $ vim scp://vivek@server1//etc/nginx/nginx.conf
```     
Also, you can open the file from within Vim in a new buffer:
 
```bash
    :e scp://vivek@centos7//etc/resolv.conf
```                                                             
---

Create `sl`, a reverse-`ls`:

```bash
    LEN=$(ls "$@"|wc -L)
    ls "$@"|rev| while read -r line
    do
    printf "%${LEN}.${LEN}s\\n" "$line" | sed 's/^\(\s\+\)\(\S\+\)/\2\1/'
    done
```
Now:

```bash
    $ sl
    pmt
    
    $ ls
    tmp
```    
---

You can use C-style printf formatting in bash:

```bash
    $ printf "%s\n" "$now"
    Wed Apr 5 00:55:45 IST 2019

    $ echo "Today is $now"
    Today is Wed Apr 5 00:55:45 IST 2019
```
You can do command substitution in an echo command itself (no need to use shell variable):

```bash
    $ echo "Today is $(date)"
    $ printf "Today is %s\n" "$(date)"
    Today is Wed Apr 5 00:57:58 IST 2019
```    
---

Example of drawing in a terminal:

```bash
    P=(' ' █ ░ ▒ ▓) ; while :;do printf "\e[$[RANDOM%LINES+1];$[RANDOM%COLUMNS+1]f${P[$RANDOM%5]}";done
```
---

How to setup an auto-completion:

https://www.cyberciti.biz/faq/add-bash-auto-completion-in-centos-8-linux

```bash
    $ complete -W '192.168.1.11 mydomain.com another.com' ping
```
Now type ping and press the [TAB] key to use any one of the domain names/IP address for ping command:

```bash
    $ ping [TAB]
    192.168.1.11 mydomain.com another.com
```
Auto-completion is done using auto-complete package:

```bash
    $ dnf install bash-completion
```
Here's how it is defined by default:

```bash
    $ cat /etc/profile.d/bash_completion.sh
    # Check for interactive bash and that we haven't already been sourced in CentOS server
    if [ -n "${BASH_VERSION-}" -a -n "${PS1-}" -a -z "${BASH_COMPLETION_VERSINFO-}" ]; then
     
        # Check for recent enough version of bash.
        if [ ${BASH_VERSINFO[0]} -gt 4 ] || \
           [ ${BASH_VERSINFO[0]} -eq 4 -a ${BASH_VERSINFO[1]} -ge 1 ]; then
            [ -r "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion" ] && \
                . "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion"
            if shopt -q progcomp && [ -r /usr/share/bash-completion/bash_completion ]; then
                # Source completion code.
                . /usr/share/bash-completion/bash_completion
            fi
        fi
     
    fi
    fi
```    
---

Idiomatic line count to know how big the project is:

```bash
    $ git ls-files "*.CPP" "*.cpp" "*.H" "*.h" "*.C" "*.c" | xargs wc -l
``` 
---

A neat way to compare two files at different hosts, using `diff`
https://www.tecmint.com/compare-local-and-remote-files-in-linux/

```bash
    $ ssh user@host "cat /home/user/file_remote" | diff - file_local
    
    $ diff <(ssh user@host1 `cat /path/to/file1`) <(ssh user@remote2 `cat /path/to/file2`)
```
---

User input pattern:

```bash
    #!/bin/bash
    while
    do
      echo "hi"
      read -r -p "what is your answer? [Y/n] " input
      case $input in
        [yY][eE][sS]|[yY])
             echo "it was yes"
             break
             ;;
        [nN][oO]|[nN])
             echo "it was no"
             break
             ;;
        *)
        echo "Invalid input..."
       exit 1
       ;;
      esac
    done
```      
---
