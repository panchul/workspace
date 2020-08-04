# Workspace

If you are familiar with Virtual Box, Vagrant, Ansible, etc., you would know what
this repository is. If you do not, you should - virtualization and
all sorts of orchestration and provisioning are hard to void regardless of
what kind of software-related activity you are involved in.

This repository contains all you need to set up a convenient development
environment on your machine for distributed programming.
It spawns and provisions virtual machines that have their own network
configured, making it easy to apply and host any code you want to run.

I created it as a simple way to have templates and pre-made samples
of relatively complicated things like distributed Erlang nodes on separate
servers, trying out prof-of-concept demos for proxies and big-data tools.
It could be a starting point for prototypes on variety of technologies.
More information is in `doc` folder, [doc/Links.md](doc/Links.md).

Pre-requisites include VirtualBox, Vagrant, and Ansible.
Once you have those on your host machine, you can spin off the vms listed below
in the order they are defined in `ansible.vmhosts`.
File `hosts_append.txt` is apended to each VM's `/etc/hosts` to
eliminate the need for dns server.

```
|==================+=================+======================================================|==========|  
| Ip               | Box name        | Comments                                             | misc     |   
|==================+=================+======================================================|==========|  
|192.168.10.2      | test1           | a machine to test vagrant itself(box versions, etc)  |          |  
|------------------+-----------------+------------------------------------------------------|----------|  
|192.168.10.3      | gen1            | a generic machine with shell provisioning only       |          |  
|------------------+-----------------+------------------------------------------------------|----------|  
|192.168.10.4      | gen2            | another generic machine with shell provisioning only |          |  
|------------------+-----------------+------------------------------------------------------|----------|  
|192.168.10.5      | gen3            | a more elaborate generic machine                     |          |  
|==================+=================+======================================================|==========|  
|192.168.10.6-10   | ...             |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.11     | yser1           | YARC node                                            |          |
|192.168.10.12     | yser2           | YARC node                                            |          |
|192.168.10.13     | yser3           | YARC node                                            |          |
|192.168.10.14     | yser4           | YARC node                                            |          |
|192.168.10.15     | yser5           | YARC node                                            |          |
|==================+=================+======================================================|==========|  
|192.168.10.16-20  | ...             |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.21     | ycli1           | YARC node                                            |          |
|192.168.10.22     | ycli2           | YARC node                                            |          |
|192.168.10.23     | ycli3           | YARC node                                            |          |
|192.168.10.24     | ycli4           | YARC node                                            |          |
|192.168.10.25     | ycli5           | YARC node                                            |          |
|==================+=================+======================================================|==========|  
|192.168.10.26     | cpp1            | generic sandboxes for C++ development.               |          |
|192.168.10.27     | cpp2            |    * Clones, among other things, sb_cpp repo         |          |
|192.168.10.28     | cpp3            |                                                      |          |
|192.168.10.29     | cpp4            |                                                      |          |
|192.168.10.30     | cpp5            |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.31     | erlang1         | generic sandboxes for Erlang development.            |          |
|192.168.10.32     | erlang2         |    * Clones, among other things, sb_erl repo         |          |
|192.168.10.33     | erlang3         |                                                      |          |
|192.168.10.34     | erlang4         |                                                      |          |
|192.168.10.35     | erlang5         |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.36     | scala1          | generic sandboxes for Scala development.             |          |
|192.168.10.37     | scala2          |    * Clones, among other things, sb_scala repo       |          |
|192.168.10.38     | scala3          |                                                      |          |
|192.168.10.39     | scala4          |                                                      |          |
|192.168.10.40     | scala5          |                                                      |          |
|192.168.10.40     | scala5          |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.41     | mysql1          | mySQL boxes                                          |          |
|192.168.10.42     | mysql2          |                                                      |          |
|192.168.10.43     | mysql3          |                                                      |          |
|192.168.10.44     | mysql4          |                                                      |          |
|192.168.10.45     | mysql5          |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.46     | haproxy1        | HAProxy boxes                                        |          |
|192.168.10.47     | haproxy2        |  (haproxy1 load balances http port to apache1,2,3)   |          |
|192.168.10.48     | haproxy3        |                                                      |          |
|192.168.10.49     | haproxy4        |                                                      |          |
|192.168.10.50     | haproxy5        |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.51     | shell1          | a generic sandbox for shell script development.      |          |
|                  |                 |    * Clones, among other things, sb_shell repo       |          |
|==================+=================+======================================================|==========|  
|192.168.10.52     | perl1           | a generic sandbox for Perl development.              |          |
|192.168.10.53     | perl2           |   * Clones, among other things, sb_perl repo         |          |
|==================+=================+======================================================|==========|  
|192.168.10.54     | javascript1     | Javascript sandboxes                                 |          |
|192.168.10.55     | javascript2     |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.56     | zookeeper1      | Zookeeper vms                                        |          |
|192.168.10.57     | zookeeper2      |                                                      |          |
|192.168.10.58     | zookeeper3      |                                                      |          |
|192.168.10.59     | zookeeper4      |                                                      |          |
|192.168.10.60     | zookeeper5      |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.61     | kafka_broker1   | Kafka nodes                                          |          |
|192.168.10.62     | kafka_broker2   |                                                      |          |
|192.168.10.63     | kafka_broker3   |                                                      |          |
|192.168.10.64     | kafka_broker4   |  I put kafka-monitor on this one                     |          |
|192.168.10.65     | kafka_broker5   |  dockerized (1x1 cluster )                           |          |
|==================+=================+======================================================|==========|  
|192.168.10.66     | golang1         | Golang sandbox                                       |          |
|192.168.10.67     | golang2         |                                                      |          |
|192.168.10.68     | golang3         |                                                      |          |
|192.168.10.69     | golang4         |                                                      |          |
|192.168.10.70     | golang5         |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.71     | docker1         | Docker sandbox                                       |          |
|192.168.10.72     | docker2         |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.73     | apache1         | Apache web server sandboxes.                         |          |
|192.168.10.74     | apache2         |                                                      |          |
|192.168.10.75     | apache3         |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.76     | git1            | Git sandbox. For Git daemon scenarios, etc.          |          |
|192.168.10.77     | git2            |                                                      |          |
|192.168.10.78     | git3            |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.79     | jenkins1        | Jenkins sandbox. For CICD tests, etc.                |          |
|192.168.10.80     | jenkins2        |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.81     | ssh1            | SSH sandbox. For SSH scenarios.                      |          |
|192.168.10.82     | ssh2            |                                                      |          |
|192.168.10.83     | ssh3            |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.84     | nginx1          | Nginx sandbox.                                       |          |
|192.168.10.85     | nginx2          |                                                      |          |
|192.168.10.86     | nginx3          |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.87     | wp1             | WordPress sandbox. Web servers.                      |          |
|192.168.10.88     | wp2             |                                                      |          |
|192.168.10.89     | wp3             |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.90     | snmp1           | SNMP sandbox.                                        |          |
|192.168.10.91     | snmp2           |                                                      |          |
|192.168.10.92     | snmp3           |                                                      |          |
|==================+=================+======================================================|==========|  
|192.168.10.93     | elixir1         | Elixir sandbox.                                      |          |
|192.168.10.94     | elixir2         |                                                      |          |
|192.168.10.95     | elixir3         |                                                      |          |
|==================+=================+======================================================|==========|  
```                                                                                          

The VMs have a mapped folder to the host, `/vagrant`, and `projects`,
but as a general rule, they fetch and deploy everything in their own ephemeral space,
for example, cloning a sandbox git repository in the home folder of user 'vagrant'.


Other sandbox repositories could be provisioned on these boxes. For example,

* [https://github.com/panchul/sb_ansible](https://github.com/panchul/sb_ansible)
* [https://github.com/panchul/sb_arduino](https://github.com/panchul/sb_arduino)
* [https://github.com/panchul/sb_cpp](https://github.com/panchul/sb_cpp)
* [https://github.com/panchul/sb_csharp](https://github.com/panchul/sb_csharp)
* [https://github.com/panchul/sb_docker](https://github.com/panchul/sb_docker)
* [https://github.com/panchul/sb_erl](https://github.com/panchul/sb_erl)
* [https://github.com/panchul/sb_fsharp](https://github.com/panchul/sb_fsharp)
* [https://github.com/panchul/sb_golang](https://github.com/panchul/sb_golang)
* [https://github.com/panchul/sb_javascript](https://github.com/panchul/sb_javascript)
* [https://github.com/panchul/sb_jenkins](https://github.com/panchul/sb_jenkins)
* [https://github.com/panchul/sb_perl](https://github.com/panchul/sb_perl)
* [https://github.com/panchul/sb_python](https://github.com/panchul/sb_python)
* [https://github.com/panchul/sb_scala](https://github.com/panchul/sb_scala)
* [https://github.com/panchul/sb_shell](https://github.com/panchul/sb_shell) - sandbox for shell
 script development, tips and tricks you don't have to re-type every time you need them on a new machine.
