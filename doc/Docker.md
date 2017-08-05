
## Under Construction

# Docker

See also [DockerCompose](DockerCompose.md)


My Docker sandbox is [https://github.com/panchul/sb_docker](https://github.com/panchul/sb_docker).

---

https://www.docker.com/

---

Docker for Ubuntu:

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements

---

Nice summary of ```Entrypoint``` vs ```CMD```

https://www.ctl.io/developers/blog/post/dockerfile-entrypoint-vs-cmd/

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
    