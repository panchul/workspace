
## Under Construction

# Docker

See also:
 - [DockerCompose](DockerCompose.md)
 - [DockerCSwarm](DockerSwarm.md)


My Docker sandbox is [https://github.com/panchul/sb_docker](https://github.com/panchul/sb_docker).

---

https://www.docker.com/

Installation:

https://docs.docker.com/engine/installation/

To start the daemon:

    $ sudo  systemctl start docker

---

Docker for Ubuntu:

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements

---

Nice summary of ```Entrypoint``` vs ```CMD```

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
Write this into file name ```Dockerfile```

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
