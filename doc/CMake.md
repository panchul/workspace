# cmake

https://cmake.org/download/

www.kitware.com

---

See Also:

 - [Autoconf](Autoconf.md)
 - [Automake](Automake.md)
 - [Make](Make.md)

---

**Contents**

- [Installing or Upgrading](CMake.md#installing-or-ugrading)
- [cmake-gui](CMake.md#cmake-gui)
- [Tutorials](CMake.md#tutorials)
- [Miscellaneous](CMake.md#miscellaneous)

---

## Installing or Ugrading

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

## cmake-gui

---

There is a gui `cmake-gui` and a terminal gui `ccmake`. They allow configuring and generating the builds.

---

## Tutorials

---

https://cmake.org/cmake/help/latest/guide/tutorial/index.html

---

## Miscellaneous

---
