
## UNDER CONSTRUCTION

# make

---

Gnu make: [https://www.gnu.org/software/make/](https://www.gnu.org/software/make/)

---

Here is the manual in .html : [https://www.gnu.org/software/make/manual/make.html](https://www.gnu.org/software/make/manual/make.html)

---

Idiomatic example of using addsuffix to place obj files one directory below the source.

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

The long lines split with ```\``` works in Makefile

---

To get output of commands into vars in Makefile:

    MYTIMESTAMP=$(shell date)
    

---

On Mac, make is here if you are using XCode:

/Applications/Xcode.app/Contents/Developer/usr/bin/

---
