[Home](Readme.md)
# make

---

Gnu make: [https://www.gnu.org/software/make/](https://www.gnu.org/software/make/)

See Also:

 - [Autoconf](Autoconf.md)
 - [Automake](Automake.md)
 - [Buck](Buck.md)
 - [CMake](CMake.md)

---

**Contents**

- [Miscellaneous](Make.md#miscellaneous)

---

## Miscellaneous

---

Here is the manual in .html : [https://www.gnu.org/software/make/manual/make.html](https://www.gnu.org/software/make/manual/make.html)

---

Nice overview.
https://dev.to/yankee/streamline-projects-using-makefile-28fe

Neat trick with `help`:

    .DEFAULT_GOAL := help 
    help: # Show this help
    @egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

---

`pushd` and `popd` are not available in makefile - the context is messy. A workaround is to use:

    oldpath=`pwd`
    ...hack, hack, hack...
    cd $oldpath

---

Idiomatic example of using `addsuffix` to place obj files one directory below the source.

    SOURCE += MainThread.cpp
    SOURCE += Blah.cpp

    OBJ=$(join $(addsuffix ../obj/, $(dir $(SOURCE))), $(notdir $(SOURCE:.cpp=.o)))

From the make manual: http://www.gnu.org/software/make/manual/make.html

    $(addprefix prefix,names...)

    The argument names is regarded as a series of names, separated by whitespace; 
    prefix is used as a unit. The value of prefix is prepended to the front of each 
    individual name and the resulting larger names are concatenated with single 
    spaces between them. For example,

    $(addprefix src/,foo bar)

    produces the result 'src/foo src/bar'. 

---

The long lines split with ```\``` work in Makefile

---

To get output of commands into vars in Makefile:

    MYTIMESTAMP=$(shell date)
    
---

On Mac, make is here if you are using XCode:

/Applications/Xcode.app/Contents/Developer/usr/bin/

---

To define a wildcard, you need to explicitly say that it is a wildcard:
    
    objects := $(wildcard *.o)

Or it will be just a string variable.

---

From https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html

Joining lists.

    $(join list1,list2)

---

Automatic variables:
https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables

    $^ - pre-requisites
    $< - name of the first prerequisite
    $? - names of all prerequisites that are newer than the target
    
    $@ - name of the target of the rule
    etc.

---
