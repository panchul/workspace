
# Workspace


\[ Under construction \]

If you are familiar with Vagrant and Ansible, you would know what
this repository is. If you do not, you should - virtualization and
all sorts of orchestration and provisioning are hard to void regardless of
what kind of software-related activity you are involved in.

This repository contains all you need to setup a convenient development
environment on your machine for distributed programming.
It spawns and provisions virtual machines that have their own network
configured, making it easy to apply and host any code you want to run.

I created it as a simple way to have templates and pre-made samples
of relatively complicated things like distributed Erlang nodes on separate
servers.
It is intended to be a starting point for prototypes on variety of
technologies.
More information is in ```doc``` folder, [doc/Links.md](doc/Links.md).

Pre-requisites include VirtualBox, Vagrant, and Ansible.
(Ansible is not officially supported on Windows, there are some
shell provisioning scripts to compensate, in work-in-progress state)
Once you have those on your host machine, you can spin off the vms:

* gen1 - a generic machine with shell provisioning only
* gen2 - another generic machine with shell provisioning only
* gen3 - a more elaborate generic machine
* yser1 - YARC node
* yser2 - YARC node
* yser3 - YARC node
* ycli1 - YARC node
* ycli2 - YARC node
* ycli3 - YARC node
* cpp1 - a generic sandbox for C++ development.
    * Clones, among other things, sb_cpp repo
* erlang1 - a generic sandbox for Erlang development.
    * Clones, among other things, sb_erl repo
* scala1 - a generic sandbox for Scala development.
    * Clones, among other things, sb_scala repo
* shell1 - a generic sandbox for shell script development.
    * Clones, among other things, sb_shell repo
* perl1 - a generic sandbox for Perl development.
    * Clones, among other things, sb_perl repo

Other sandbox repositories could be provisioned on these boxes. For example,

* [https://github.com/panchul/sb_arduino](https://github.com/panchul/sb_arduino)
* [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp)
* [https://github.com/panchul/sb_docker](https://github.com/panchul/sb_docker)
* [https://github.com/panchul/sb_erl](https://github.com/panchul/sb_erl)
* [https://github.com/panchul/sb_golang](https://github.com/panchul/sb_golang)
* [https://github.com/panchul/sb_javascript](https://github.com/panchul/sb_javascript)
* [https://github.com/panchul/sb_perl](https://github.com/panchul/sb_perl)
* [https://github.com/panchul/sb_scala](https://github.com/panchul/sb_scala)
* [https://github.com/panchul/sb_shell](https://github.com/panchul/sb_shell) - sandbox for shell
 script development, tips and tricks you don't have to re-type every time you need them on a new machine.


TODO: Make a diagram how the other repos are connected to this one using
shared folders.

TODO: Make a link to the wiki with more explanations as it becomes available






