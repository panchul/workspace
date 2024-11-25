[Home](Readme.md)
# XWindows

---

Simple xwin server(if you are using RDP, open port 3389):

```bash
    $ apt-get update
    $ apt-get install xfce4
    $ apt-get install xrdp
    $ echo xfce4-session > ~/.xsession
    $ service xrdp restart
```

If you did not explicitly set the login/password on that server
(for example, you spawned it on the cloud with a key), set the password:

```bash
    $ sudo passwd whatever_your_login_is
```

---

For Drake's Meshcat on AWS I had to `chmod 755 $XAUTHORITY` for their server to work.

---