[Home](Readme.md)
# Boost library

http://www.boost.org/

---

See Also:

- ...

---

**Contents**

- [Miscellaneous](Boost.md#miscellaneous)

---

## Miscellaneous

---

on Linux this seem to work:

    $ sudo apt-get install libboost-all-dev

---

Boost Serialization package links

- https://www.boost.org/doc/libs/1_68_0/libs/serialization/doc/index.html
- https://www.boost.org/doc/libs/1_68_0/libs/serialization/example/demo.cpp
- https://www.boost.org/doc/libs/1_68_0/libs/serialization/doc/tutorial.html#simplecase

---

boost logger linking issue on Mac
https://solarianprogrammer.com/2018/08/07/compiling-boost-gcc-clang-macos/
https://stackoverflow.com/questions/18881602/boost-logger-linking-issue

This might be needed, or link the .a explicitly

    export DYLD_LIBRARY_PATH=/usr/local/boost-1.68.0/lib:$DYLD_LIBRARY_PATH

---

IPC log backend:
boost_1_72_0/libs/log/doc/html/log/detailed/utilities.html#log.detailed.utilities.ipc.reliable_message_queue

---

Nice example of practical thread pool group:
boost.org ... libs/log/example/multiple_files/main.cpp

---