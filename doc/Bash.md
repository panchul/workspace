

## UNDER CONSTRUCTION

### sudo

To run a stdout redirect in a sudo line, this helped:

    sudo sh -c "echo $1 > /tmp/myserver$1/myid "

Without "sh -c" did not work:

    sudo echo $1 > /tmp/zookeeper$1/myid         <----- is not allowed.


