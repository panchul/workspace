
# Git

See Also:
 - [Mercurial](Mercurial.md)
 - [Subversion](Subversion.md)


[https://git-scm.com/](https://git-scm.com/)

https://git-scm.com/downloads

---

Git commit guidelines:

    https://chris.beams.io/posts/git-commit/

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

### Undoing things

https://rtyley.github.io/bfg-repo-cleaner/
https://jorin.me/clean-git-history/


To keep the changes:

    $ git reset --soft HEAD~1

Do the things the hard way abandoning the changes:
    
    $ git reset --hard HEAD~1

---

In `.gitignore`, to exclude a file from bing ignored, use ```!filename```, for example:

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
 - merge the pull request
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

Unstageing an added file in Git(and keeping local changes):

    $ git reset HEAD path/to/file

---

Syncing with the original repo after forking.

Configuring a remote for a fork
(from here: https://help.github.com/articles/configuring-a-remote-for-a-fork/)

You must configure a remote that points to the upstream repository in Git to sync changes you make in
 a fork with the original repository. This also allows you to sync changes made in the original
  repository with the fork.

Open Terminal.

List the current configured remote repository for your fork.

    $ git remote -v
    origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
    origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)

Specify a new remote upstream repository that will be synced with the fork.

    $ git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

Verify the new upstream repository you've specified for your fork.

    $ git remote -v
    origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
    origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
    upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
    upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)

Syncing a fork
(from https://help.github.com/articles/syncing-a-fork/)

Sync a fork of a repository to keep it up-to-date with the upstream repository.
Before you can sync your fork with an upstream repository, you must configure a remote that points to
 the upstream repository in Git.

Open Terminal.

Change the current working directory to your local project.

Fetch the branches and their respective commits from the upstream repository. Commits to master will be stored in a local branch, upstream/master.

    $ git fetch upstream
    remote: Counting objects: 75, done.
    remote: Compressing objects: 100% (53/53), done.
    remote: Total 62 (delta 27), reused 44 (delta 9)
    Unpacking objects: 100% (62/62), done.
    From https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY
     * [new branch]      master     -> upstream/master

Check out your fork's local master branch.

    $ git checkout master
    Switched to branch 'master'

Merge the changes from upstream/master into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes.

    $ git merge upstream/master
    Updating a422352..5fdff0f
    Fast-forward
     README                    |    9 -------
     README.md                 |    7 ++++++
     2 files changed, 7 insertions(+), 9 deletions(-)
     delete mode 100644 README
     create mode 100644 README.md

If your local branch didn't have any unique commits, Git will instead perform a "fast-forward":

    $ git merge upstream/master
    Updating 34e91da..16c56ad
    Fast-forward
     README.md                 |    5 +++--
     1 file changed, 3 insertions(+), 2 deletions(-)

---

