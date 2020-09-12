# Docker

https://www.docker.com/

See Also:

    - [CUDA](CUDA.md)
    - [DockerCompose](DockerCompose.md)
    - [DockerSwarm](DockerSwarm.md)
    - [Kubeflow](Kubeflow.md)
    - [Kubernetes](Kuernetes.md)
    - [LXD, Linux Containers](LXD.md)

My Docker sandbox is [https://github.com/panchul/sb_docker](https://github.com/panchul/sb_docker).

**Table of contents**

 - [Installation](#Installation)
 - [Miscellaneous](#Miscellaneous)

---

## Installation  

https://docs.docker.com/engine/installation/

---

Installing on Ubuntu:

    $ sudo apt install docker.io

To start the daemon:
    
    $ sudo systemctl start docker
    
To make it start automatically:
    
    $ sudo systemctl enable docker

To not need run it as `sudo`:    
    
    $ sudo usermod -aG docker $USER
    
In some cases you might need this:

    $ sudo chmod g+rwx "$HOME/.docker" -R
    
You might want to re-login to apply your new group memebership

Testing that docker works:

    $ docker run hello-world
  
---

Docker for Ubuntu:
https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements

---

## Miscellaneous

---

Nice way to connect to the host network from outside of a Docker container.
https://dev.to/natterstefan/docker-tip-how-to-get-host-s-ip-address-inside-a-docker-container-5anh

You can use a Linux-specific `docker-compose.override.yml`, https://docs.docker.com/compose/extends/
Or set the gatewateway via environment. E.g. in `~/.bashrc`:

    export DOCKER_GATEWAY_HOST=172.17.0.1

and the .yaml:

    # docker-compose.yml
    version: '3.7'
    services:
      app:
        image: your-app:latest
        ports:
          - "8080:8080"
        environment:
          DB_UPSTREAM: http://${DOCKER_GATEWAY_HOST:-host.docker.internal}:3000

---

Nice article on how to optimize Docker containers (to not duplicate already stored content,
to avoid creating unnecessary layers, etc.)
https://dev.to/sammyvimes/docker-on-a-diet-1n6j

---

One of the ways to see the disk usage:

    $ docker system df -v

    Images space usage:

    REPOSITORY          TAG                 IMAGE ID            CREATED ago         SIZE                SHARED SIZE         UNIQUE SiZE         CONTAINERS
    ...
    centos              latest              328edcd84f1b        7 weeks ago ago     192.5MB             0B                  192.5MB             0
    ...

    Containers space usage:

    CONTAINER ID        IMAGE               COMMAND                  LOCAL VOLUMES       SIZE                CREATED ago         STATUS                     NAMES
    ...
    1ac3653c24d7        53911b53e21b        "/bin/server.out "       0                   0B                  6 weeks ago ago     Exited (137) 6 weeks ago   peaceful_carson
    ...

---

Nice summary of `Entrypoint` vs `CMD`

https://www.ctl.io/developers/blog/post/dockerfile-entrypoint-vs-cmd/


In some way it is similar to these facts:

To run a stdout redirect in a sudo line, this helped:

    $ sudo sh -c "echo $1 > /tmp/myserver$1/myid "

Without "sh -c" did not work:

    $ sudo echo $1 > /tmp/zookeeper$1/myid         <----- is not allowed.

---

Some presentations and articles:

[http://codurance.com/2016/03/01/Docker-meets-Continuous-Deployment/](http://codurance.com/2016/03/01/Docker-meets-Continuous-Deployment/)

[http://www.slideshare.net/AmazonWebServices/continuous-delivery-with-docker-and-amazon-ecs](http://www.slideshare.net/AmazonWebServices/continuous-delivery-with-docker-and-amazon-ecs)

[http://www.slideshare.net/aheifetz/continous-40224264](http://www.slideshare.net/aheifetz/continous-40224264)

[http://owaaa.github.io/docker/amazon/aws/devops/continuous/delivery/2014/10/10/docker_continous_delivery.html](http://owaaa.github.io/docker/amazon/aws/devops/continuous/delivery/2014/10/10/docker_continous_delivery.html)


https://circleci.com/blog/its-the-future/ An article about Docker and Vagrant

---

Quick and simple Dockerfile.
Write this into file name `Dockerfile`

    FROM ubuntu:trusty
    RUN echo 'I like Docker, and it works!'
    CMD ping localhost

    # Might want to do something like:
    # ENTRYPOINT ["/bin/ping","-c","3"]
    # CMD ["localhost"]

Then build an image

    $ docker build -t mydemo
    
Then run the image:

    $ docker run 3485629465 -d
         
See that it runs:

    $ docker ps -l --no-trunc

See what it is outputting:

    $ docker logs 2364586249
    
---

If the services are running on their own, the entry point could be just command like

    $ /bin/bash -c tail -f /usr/local/mywebserver/log.out

---

Example how to save a docker image in a file:

    $ docker image save docker-myrepo.com/base/myserver:myversion-1.2.3 | gzip > mybase_myserver_myversion-1.2.3.docker.tgz

And restore in a similar fashion.

---

Neat trick to use dockerized Kafka instead of the command line.
```--rm``` removes the container when exits.
```-i```  iteractive mode 
```-t```  allocate pseudo tty 

    $ docker run --rm -it ches/kafka:0.10.1.0 bin/kafka-topics.sh --zookeeper mykafka.mykafkadomain:2181 --topic testTopic --describe
    Topic:testTopic	PartitionCount:3	ReplicationFactor:1	Configs:
	    Topic: testTopic	Partition: 0	Leader: 1001	Replicas: 1001	Isr: 1001

---

Transferring files in and out of a container without mounting volumes.

    $ docker cp ~/file.txt $container_id:/home/me/
    $ docker cp $container_id:/home/me/file.txt .

---

Linking containers. E.g. Zookeeper and Kafka on containers, with internal network named ```myzk```:

    $ docker run --name my-zookeeper -p 2181:2181 myartefactory:8080/my-zookeeper
    $ docker run --link my-zookeeper:myzk --name my-kafka -p 9092:9092 myartefactory:8080/my-kafka

---

From here: https://docs.docker.com/compose/bundles/

About experimental Docker features:
 
The easiest way to produce a bundle is to generate it using docker-compose from an existing docker-compose.yml.
Of course, that’s just one possible way to proceed, in the same way that docker build isn’t the only way to
produce a Docker image.
From docker-compose:

    $ docker-compose bundle
    WARNING: Unsupported key 'network_mode' in services.nsqd - ignoring
    WARNING: Unsupported key 'links' in services.nsqd - ignoring
    WARNING: Unsupported key 'volumes' in services.nsqd - ignoring
    [...]
    Wrote bundle to vossibility-stack.dab

---

Nice Docker cheat sheet repo, a number of nice links and how-tos:

https://github.com/wsargent/docker-cheat-sheet

---

Link about how to mount volumes on a running Docker container, nice script to automate it.
https://jpetazzo.github.io/2015/01/13/docker-mount-dynamic-volumes/

---

Nice meetup talk about container monitoring. Sysdig, Datadog and Prometheus, etc.
https://www.youtube.com/watch?v=XiC6Dy38HnA

---

VMs vs. Containers. Refresher
https://www.backblaze.com/blog/vm-vs-containers/

Basically, containers have containter daemon on host instead of hypervisor on host and guest OS per vm.

---

Neat step-by-step demos for basic usage of Docker:
http://engineering.hipolabs.com/understand-docker-without-losing-your-shit/

---
