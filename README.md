
# Workspace


\[ Under construction \]

If you are familiar with Vagrant and Ansible, you would know what
this repository is. If you do not, you should - virtualization and
all sorts of orchestration and provisioning are hard to void regardless of
what kind of software-related activity you are involved in.

This repository contains all you need to setup a convinient development
environment on your machine for distributed programming.
It spawns and provisions virtual machines that have their own network
configured, making it easy to apply and host any code you want to run.

I created it as a simple way to have templates and pre-made samples
of relatively complicated things like distributed Erlang nodes on separate
servers.
It is intended to be a starting point for prototypes on variety of
technologies.

Pre-requisites include VirtualBox, Vagrant, and Ansible.
Once you have those on your host machine, you can provision the VMs for
particular type of work, and clone the sandboxes:

* sb_cpp - sandbox for C++ development.
* sb_erlang - sandbox for Erlang development.
* sb_bash - sandbox for bash development, tips and tricks you don't have
to re-type every time you need them on a new machine.


TODO: Make a diagram how the other repos are connected to this one using
shared folders.

TODO: Make a link to the wiki with more explanations as it becomes available






