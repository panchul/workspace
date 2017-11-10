
# Git

See Also:
 - [Mercurial](Mercurial.md)
 - [Subversion](Subversion.md)


[https://git-scm.com/](https://git-scm.com/)

https://git-scm.com/downloads
---

Another gui for git, SourceTree
https://www.sourcetreeapp.com/

---

Sometimes you need to run ```apt-get update``` to see git package. For example in a Dockerfile:

    ...
    RUN apt-get update
    RUN apt-get -y install git
    ...
    
- did not work without update, for some distros of ubuntu.

---

Git is part of XCode on Mac.

For Windows these options during installation worked ok:

    with Windows Command Line (no bash, no optional Unix tools)
    checkout as-is, commit as-is (that is "core.autocrlf" is set to "false")
    use MinTTY (the default terminal of MSYS2)
    emable file system caching ("core.fscache" is "true")
    enable git credential manager

---

Utility ```dos2unix``` was handy for those pesky ```"\r\n"``` .

There were some issues with the credentials on Cygwin.

---

### Undoing pushes, the hard way

https://rtyley.github.io/bfg-repo-cleaner/
https://jorin.me/clean-git-history/

---

### .gitignore notes

to exclude a file from bing ignored, use ```!filename```, for example:

    ...
    some_local_folder
    !some_local_folder/.git_keep

---

Normal cycle:

Fetch the repo:

    git clone [repo name]
    
Go to the branch you want to branch from, and create a feature branch
    
    git checkout -b featurebranch
    
Hack, hack, hack
When ready, commit the files into the remote feature branch:

    git add [files changed]
    git commit -m "implemented fieature x"
    git push

At the Github create the pull request.
When ready, at Github:
 - merge the pull retuest
 - delete the feature branch
 - delete local feature branch
    
---

The thing I often do to put the changes into the correct branch:

    hack hack hack
    $ git stash
    $ git checkout the_branch_i_want
    $ git stash pop
    
---

Example of starting a new repo from existing sources
           
    $ cd /path/to/the_project
    $ git init     
    $ git add .    
    $ git commit       

    $ mkdir tmp ; cd ~/tmp
    $ git clone file://localhost:/the_project
      Cloning into 'myproj'...
      warning: You appear to have cloned an empty repository.
      Checking connectivity... done.

---

Nice way to search:

    $ git grep -e "pattern" branch -- some/file

    $ git log --pickaxe-regex -S"some.*code.*change"
    
---

One way to set up a git-daemon (see another one below)
https://git-scm.com/book/en/v2/Git-on-the-Server-Git-Daemon

Create git group and git user (restrict them properly).
Crate folder ```/srv/git/```
Create file ```/etc/systemd/system/git-daemon.service```:

    ==================
    [Unit]
    Description=Start Git Daemon
    
    [Service]
    ExecStart=git daemon --reuseaddr --base-path=/srv/git/ /srv/git/
    
    Restart=always
    RestartSec=500ms
    
    StandardOutput=syslog
    StandardError=syslog
    SyslogIdentifier=git-daemon
    
    User=git
    Group=git
    
    [Install]
    WantedBy=multi-user.target
    ==================
    
Run to automatically start the service on boot.
   
    $ systemctl enable git-daemon

To start:
    
    $ systemctl start git-daemon

Similar to stop, restart, etc.
If you edit the git-daemon.service file, you might run this to refresh the config:

    $ systemctl daemon-reload

In the repository you need to let the repo be exported:

    $ cd /path/to/
    $ git init --shared --bare project.git
    $ cd /path/to/project.git
    $ touch git-daemon-export-ok

In /etc/services there is a line for git-daemon port:

```
...
git             9418/tcp                        # Git Version Control System
...
```

To let others push into this repository, add to the git repository's config file:

    $ cd /path/to/project.git
    $ vi config
    
    ...
    [daemon]
    # UNSECURE anonymous Write access
        receivepack = true
    ...

---

This seems to be more useful:
https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server





---

If you write a script with name ```git-somename```, and add it to PATH, git will execute it when you run, for example:

    $ git somename arg1 arg2 whatever

---

Another neat trick to keep but not track a file. This will allow you to
get a local changes be ignored by git:

    $ git update-index --assume-unchanged Makefile

If you do want to push the local changes to that file, turn it back on:

    $ git update-index --no-assume-unchanged Makefile
    $ git add -p Makefile
     # ...
     # add the makefile shanges
     # ...
    $ git commit
    $ git update-index --assume-unchanged Makefile
    $ git push

---

There is a feature in git, to make easier merging:

    $ git config --global rerere.enabled true

It saves left and right for the merge and caches the resolution.

---