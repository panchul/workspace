# gunicorn

See Also:

  - [Django](Django.md)
  - [Flask](Flask.md)
  - [Plotlydash](Plotlydash.md)
  - [Triton inference server](Triton_inference_server.md)


https://gunicorn.org/

web services framework, sometimes it is used behind nginx to
serve http requests, to serve Flask, etc.

---

**Contents**

- [Installing](Gunicorn.md#installing)
- [Miscellaneous](Gunicorn.md#miscellaneous)

---

## Installing

---

```bash
$ pip install gunicorn
$ cat myapp.py
def app(environ, start_response):
    data = b"Hello, World!\n"
    start_response("200 OK", [
        ("Content-Type", "text/plain"),
        ("Content-Length", str(len(data)))
    ])
    return iter([data])

$ gunicorn -w 4 myapp:app
[2014-09-10 10:22:28 +0000] [30869] [INFO] Listening at: http://127.0.0.1:8000 (30869)
[2014-09-10 10:22:28 +0000] [30869] [INFO] Using worker: sync
[2014-09-10 10:22:28 +0000] [30874] [INFO] Booting worker with pid: 30874
[2014-09-10 10:22:28 +0000] [30875] [INFO] Booting worker with pid: 30875
[2014-09-10 10:22:28 +0000] [30876] [INFO] Booting worker with pid: 30876
[2014-09-10 10:22:28 +0000] [30877] [INFO] Booting worker with pid: 30877
```

---

Do the regular [Python](Python.md) install, with, for example virtual environments,
then:

```bash
    $ pip install gunicorn
```

---

To allow port 8000 in the [Firewall](Firewall.md):

```bash
    $ sudo ufw allow 8000
```

To run, for example, a [Django](Django.md) app:

```bash
    $ python manage.py runserver 0.0.0.0:8000
```

To use gunicorn:

```bash
    $ gunicorn --bind 0.0.0.0:8000 MyAppName.wsgi
```

---

To setup gunicorn better, create `/etc/systemd/system/gunicorn.socket` (on [Ubuntu](Ubuntu.md)):

```
[Unit]
Description=gunicorn socket

[Socket]
ListenStream=/run/gunicorn.sock

[Install]
WantedBy=sockets.target
```

And the service file, create `/etc/systemd/system/gunicorn.service` (on [Ubuntu](Ubuntu.md)):

```
[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=alexp
Group=www-data
WorkingDirectory=/home/alexp/src/someappname
ExecStart=/home/alexp/src/someappname/venv/bin/gunicorn \
        --access-logfile - \
        --workers 3 \
        --bind unix:/run/gunicorn.sock \
        Someappname.wsgi:application

[Install]
WantedBy=multi-user.target
```    

Now you can start it with `systemctl`:

```bash
    $ sudo systemctl start gunicorn.socket

    $ sudo systemctl enable gunicorn.socket
    Created symlink /etc/systemd/system/sockets.target.wants/gunicorn.socket → /etc/systemd/system/gunicorn.socket.

    $ sudo systemctl status gunicorn.socket
```

Do the same for `gunicorn.service` !

To reset the `service-start-limit-hit` error, do the following(from
https://askubuntu.com/questions/1089310/how-to-resolve-service-start-limit-hit):

```bash
    $ systemctl reset-failed servicename.service
```

Also, if a module is missing, or you cannot import Django. Are you sure it's installed and
available on your `PYTHONPATH` environment variable? Did you forget to activate a virtual environment?

To connect the whole thing to [nginx](Nginx.md), create an entry in
`/etc/nginx/sites-available/someappname`

```
server {
    listen 80;
    server_name 127.0.0.1;
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /static/ {
        root /home/alexp/src/someappname;
    }
    location / {
        include proxy_params;
        proxy_pass http://unix:/run/gunicorn.sock;
    }
}
```

You can create a symbolic link to the [nginx](Nginx.md) sites:

```bash
    $ sudo ln -s /etc/nginx/sites-available/someappname /etc/nginx/sites-enabled
```

And test if the config is ok:

```bash
    $ sudo nginx -t
    nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
    nginx: configuration file /etc/nginx/nginx.conf test is successful
```

---

## Miscellaneous

