[Home](Readme.md)
# cmake

https://cmake.org/download/

www.kitware.com

---

See Also:

 - [Autoconf](Autoconf.md)
 - [Automake](Automake.md)
 - [Buck](Buck.md)
 - [Make](Make.md)

---

**Contents**

- [Installing or Upgrading](CMake.md#installing-or-upgrading)
- [cmake-gui](CMake.md#cmake-gui)
- [Basic commands](CMake.md#basic-commands)
- [Install commands](CMake.md#install-commands)
- [Tutorials](CMake.md#tutorials)
- [Multithreading](CMake.md#multithreading)
- [Header dependencies](CMake.md#header-dependencies)
- [Miscellaneous](CMake.md#miscellaneous)

---

## Installing or Upgrading

### On Linux

Check your current version:

    $ cmake --version

Uninstall it with this if necessary:

    $ sudo apt remove cmake

Visit https://cmake.org/download/ and download the latest bash script(something
like `cmake-3.10.0-Linux-x86_64.sh`).

You can download or copy the script to `/opt/` - that's the default install location.

Make the script executable:

    $ chmod +x /opt/cmake-3.*your_version*.sh

Change to desired installation directory (to `/opt/` for example)
As of cmake 3.10.2 the installer no longer seems to install to /opt by default

Run:

    $ sudo bash /opt/cmake-3.*your_version*.sh

You will need to press `y` twice.

The script installs the binary to `/opt/cmake-3.*your_version*` so in order to get
the cmake command, make a symbolic link if needed, the installer may
have already created one for all binaries:

    $ sudo ln -s /opt/cmake-3.*your_version*/bin/* /usr/local/bin

You may need to restart your terminal to 'see' the correct binary in the path.

Check that you got the version you wanted:

    $ cmake --version

---

On Ubuntu, or other places, there could be an error about Ninja, install that package
like so:

    $ apt install ninja-build

Might also need to link it:

    # ln -s /usr/bin/ninja /usr/bin/ninja-build

There is a [longer discussion](https://stackoverflow.com/questions/38658014/ninja-not-found-by-cmake).

---

### On MacOS

---

On modern OSes, the default download location, `Downloads`, could be
quaranteened, so the .app has to be moved.


There is an easy way of adding the CMake tool to the `PATH`, by running:

```bash
$ sudo "/Applications/CMake.app/Contents/bin/cmake-gui" --install=/usr/local/bin
```

Check that it worked:

```bash
$ cmake --version
```

Here's a gist with more details https://gist.github.com/fscm/29fd23093221cf4d96ccfaac5a1a5c90

---

## cmake-gui

---

There is a gui `cmake-gui` and a terminal gui `ccmake`. They allow configuring and generating the builds.

---

## Basic commands

---

In simple config, this should be enough:

To generate (in current folder):

    $ cmake .

To build:

    $ cmake --build .

To install:

    $ cmake --install .

---

## Install commands

To install to a specific directory(prefix):

    $ cmake --install . --prefix ~/pxl

---

https://cmake.org/cmake/help/latest/command/install.html

```
install(FILES logo.png
        DESTINATION ${CMAKE_INSTALL_DOCDIR}/myproj
)
```

or

```
install(DIRECTORY src/ DESTINATION doc/myproj
        FILES_MATCHING PATTERN "*.png")
```

---

For a project:

```
add_executable(myExe myExe.c)
add_library(myStaticLib STATIC myStaticLib.c)
target_sources(myStaticLib PUBLIC FILE_SET HEADERS FILES myStaticLib.h)
add_library(mySharedLib SHARED mySharedLib.c)
target_sources(mySharedLib PUBLIC FILE_SET HEADERS FILES mySharedLib.h)
set_property(TARGET mySharedLib PROPERTY SOVERSION 1)
```

We may call install(TARGETS) with <artifact-kind> arguments to specify different options for each kind of artifact:

```
install(TARGETS
          myExe
          mySharedLib
          myStaticLib
        RUNTIME           # Following options apply to runtime artifacts.
          COMPONENT Runtime
        LIBRARY           # Following options apply to library artifacts.
          COMPONENT Runtime
          NAMELINK_COMPONENT Development
        ARCHIVE           # Following options apply to archive artifacts.
          COMPONENT Development
          DESTINATION lib/static
        FILE_SET HEADERS  # Following options apply to file set HEADERS.
          COMPONENT Development
        )
```

Debug vs. Release

```
install(TARGETS myExe
        CONFIGURATIONS Debug
        RUNTIME
          DESTINATION Debug/bin
        )
install(TARGETS myExe
        CONFIGURATIONS Release
        RUNTIME
          DESTINATION Release/bin
        )
```        

---

## Tutorials

---

CMake's tutorial, there is also the source code with the samples:

https://cmake.org/cmake/help/latest/guide/tutorial/index.html

---

## Multithreading

---

Nice discussion about including libraries here:

https://cprieto.com/posts/2021/03/cmake-and-threads.html


```
cmake_minimum_required(VERSION 3.15)
project(hello)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Threads REQUIRED)

add_executable(hello main.cpp)
target_link_libraries(hello Threads::Threads)
```

---

## Header dependencies

---

Directory structure, etc. Include directories for subfolders.

https://stackoverflow.com/questions/13703647/how-to-properly-add-include-directories-with-cmake

Also about header dependencies

https://stackoverflow.com/questions/7461000/handling-header-files-dependencies-with-cmake

---

## Miscellaneous

---
