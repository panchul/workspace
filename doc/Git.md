
## UNDER CONSTRUCTION

# Git

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
       
       