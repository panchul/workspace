

## Under Construction

# DockerCompose

My Docker sandbox is [https://github.com/panchul/sb_docker](https://github.com/panchul/sb_docker).

---

Installing:
https://docs.docker.com/compose/install/#upgrading

---

Docker-machine install as a one-liner from here:
https://docs.docker.com/machine/install-machine/#install-machine-directly

    base=https://github.com/docker/machine/releases/download/v0.16.0 &&
        curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
        sudo install /tmp/docker-machine /usr/local/bin/docker-machine

---

Getting started:

https://docs.docker.com/compose/gettingstarted/

Gist of it:

    $ mkdir composetest
    $ cd composetest

Create app.py containing this:

    from flask import Flask
    from redis import Redis
    
    app = Flask(__name__)
    redis = Redis(host='redis', port=6379)
    
    @app.route('/')
    def hello():
        count = redis.incr('hits')
        return 'Hello World! I have been seen {} times.\n'.format(count)
    
    if __name__ == "__main__":
        app.run(host="0.0.0.0", debug=True)
        
In this example, redis is the hostname of the redis container on the application’s network. We use the default port for Redis, 6379



Create ```requirements.txt``` in the project directory with this:

    flask
    redis

Create ```Dockerfile``` in the project directory:

    FROM python:3.4-alpine
    ADD . /code
    WORKDIR /code
    RUN pip install -r requirements.txt
    CMD ["python", "app.py"]

Create ```docker-compose.yml``` in the project directory:

    version: '2'
    services:
      web:
        build: .
        ports:
         - "5000:5000"
        volumes:
         - .:/code
      redis:
        image: "redis:alpine"
        
Start the app:

    $ docker-compose up
     Pulling image redis...
     Building web...
     Starting composetest_redis_1...
     Starting composetest_web_1...
     redis_1 | [8] 02 Jan 18:43:35.576 # Server started, Redis version 2.8.3
     web_1   |  * Running on http://0.0.0.0:5000/
     web_1   |  * Restarting with stat
        
        
To see it work, run

    curl http://0.0.0.0:5000/

You might need to do ```docker-machine ip``` and open that ip address instead, or localhost.
      
The mapped app.py is editable and the changes kick in immediately.
        
To bring everything down, removing the containers entirely, also remove the data volume:

    $ docker-compose down --volumes

---

Docker-compose file can have comments, the first letter of a comment is '#'

---
        