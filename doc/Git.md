[Home](Readme.md)
# Git

See Also:

 - [Buck](Buck.md)
 - [DVC](DVC.md)
 - [Mercurial](Mercurial.md)
 - [Subversion](Subversion.md)
 - [npm](Npm.md)

---

Contents

- [Installing](Git.md#installing)
  - [on MacOS](Git.md#on-macos) 
  - [Github CLI(`gh`)](Git.md#github-cli)
- [Configuring ssh](Git.md#configuring-ssh)
- [Populating an empty repo](Git.md#populating-an-empty-repository)
- [Renaming branches](Git.md#renaming-branches)
- [Undoing things](Git.md#undoing-things)
- [Working with multiple remotes](Git.md#working-with-multiple-remotes)
- [Syncing with the original repo after forking](Git.md#syncing-with-the-original-repo-after-forking)
- [gitignore](Git.md#gitignore)
- [Troubleshooting](Git.md#troubleshooting)
  - [error 400 curl 22 ...](Git.md#error-rpc-failed-http-400-curl-22-the-requested-url-returned-error-400)
- [Miscellaneous](Git.md#miscellaneous)

---

## Installing

---

[https://git-scm.com/](https://git-scm.com/)

https://git-scm.com/downloads

---

### On MacOS

Git is part of Xcode, but also, as per [https://git-scm.com/download/mac](https://git-scm.com/download/mac) :

    $ brew install git

---

### GitHub CLI

---

For `gh`, Github CLI, See:

https://github.com/cli/cli/blob/trunk/docs/install_linux.md

---

To get `gh` going, you need to:

```bash
    $ gh auth login
    ...
```
---

## Configuring ssh

---

Following the suggested steps from https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent 
and https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account :

Generate a key:

```bash
    MINGW64 ~/.ssh: $ ssh-keygen -t ed25519 -C "myname@example.com"
    Generating public/private ed25519 key pair.
    Enter file in which to save the key (/c/Users/myname/.ssh/id_ed25519):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /c/Users/myname/.ssh/id_ed25519.
    Your public key has been saved in /c/Users/myname/.ssh/id_ed25519.pub.
    The key fingerprint is:
    SHA256:heregoesthefingerprint myname@example.com
    The key's randomart image is:
    +--[ED25519 256]--+
    here goes the random image
    +----[SHA256]-----+
```
Start the authenticating agent:

```bash
    MINGW64 ~/.ssh: $ eval "$(ssh-agent -s)"
    Agent pid 2345
```

Add the identity

```bash
    MINGW64 ~/.ssh: $ ssh-add ~/.ssh/id_ed25519
    Identity added: /c/Users/myname/.ssh/id_ed25519 (myname@example.com)
```

You can now use your public key, to, for example, GitHub, copy/paste like so:

```bash
    MINGW64 ~/.ssh : $ clip < ~/.ssh/id_ed25519.pub
```

You can check the existing keys like so: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/checking-for-existing-ssh-keys

---

You can test this key by running(see https://docs.github.com/en/authentication/connecting-to-github-with-ssh/using-ssh-agent-forwarding for more):

```bash
$ ssh -T git@github.com
# Attempt to SSH in to github
> Hi USERNAME! You've successfully authenticated, but GitHub does not provide
> shell access.
```

You may need to add this to your `~/.ssh/config`:

```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

---

## Populating an empty repository

---

Create a new repository on the command line:

```bash
    echo "# myrepo" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M main
    git remote add origin https://github.com/myaccount/myrepo.git
    git push -u origin main
```

…or push an existing repository from the command line

```bash
    git remote add origin https://github.com/myaccount/myrepo.git
    git branch -M main
    git push -u origin main
```
---

## Renaming branches

---

Switching from `master` to `main`:

```bash
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

---

## Undoing things

---

Un-stage-ing an added file in Git(and keeping local changes):

```bash
    $ git reset HEAD path/to/file
```
---

Undoing things

https://rtyley.github.io/bfg-repo-cleaner/
https://jorin.me/clean-git-history/

To keep the changes:

```bash
    $ git reset --soft HEAD~1
```

Do the things the hard way abandoning the changes:
    
```bash
    $ git reset --hard HEAD~1
```

---

To cleanup the untracked files, remove local untracked files from the current Git branch

To remove directories, run 
    
```bash
    git clean -f -d
```
or

```bash
    git clean -fd
```

To remove ignored files, run 

```bash
    git clean -f -X
```

or
    
```bash
    git clean -fX
```

To remove ignored and non-ignored files, run 

```bash
    git clean -f -x 
```

or

```bash
    git clean -fx
```

---

To remove file change from last commit, **brutally uncommitting**,
to revert the file to the state before the last commit, do:

```bash
    git checkout HEAD^ /path/to/file
```

to update the last commit with the reverted file, do:

```bash
git commit --amend
```

to push the updated commit to the repo, do:

```bash
git push -f
```

See more on it [on stackoverflow.com](https://stackoverflow.com/questions/18357511/git-remove-committed-file-after-push)

---

## Working with multiple remotes

---

```bash
    $ git push <remote> <local_branch>:<remote_name>
```

As an example, let’s say that you have created a local branch named “my-feature”.

```bash
    $ git branch
      master
    * my-feature
    feature


    $ git push origin my-feature:feature

    Enumerating objects: 6, done.
    Counting objects: 100% (6/6), done.
    Delta compression using up to 2 threads
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 513 bytes | 513.00 KiB/s, done.
    Total 3 (delta 1), reused 0 (delta 0)
    remote: Resolving deltas: 100% (1/1), completed with 1 local object.
    To https://github.com/someaccount/repo.git
        afc4881..9ae0aee  my-feature -> feature


    $ git pull

    $ git checkout my-feature

    $ git merge origin/feature

    $ git push origin my-feature:feature
```

Pushing to another repository

```bash
    $ git push <remote> <branch>

    $ git remote -v
    origin  https://github.com/user/repo.git (fetch)
    origin  https://github.com/user/repo.git (push)
    custom  https://github.com/user/custom.git (fetch)
    custom  https://github.com/user/custom.git (push)
```

E.g. pushing to remote 'origin':

```bash
    $ git push origin feature

    Enumerating objects: 6, done.
    Counting objects: 100% (6/6), done.
    Delta compression using up to 2 threads
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 513 bytes | 513.00 KiB/s, done.
    Total 3 (delta 1), reused 0 (delta 0)
    remote: Resolving deltas: 100% (1/1), completed with 1 local object.
    To https://github.com/someaccount/repo.git
        afc4881..9ae0aee  my-feature -> feature
```

---

## Syncing with the original repo after forking

Configuring a remote for a fork
(from here: https://help.github.com/articles/configuring-a-remote-for-a-fork/)

You must configure a remote that points to the upstream repository in Git to sync changes you make in
 a fork with the original repository. This also allows you to sync changes made in the original
  repository with the fork.

Open Terminal.

List the current configured remote repository for your fork.

```bash
    $ git remote -v
    origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
    origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
```

Specify a new remote upstream repository that will be synced with the fork.

```bash
    $ git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
```

Verify the new upstream repository you've specified for your fork.

```bash
    $ git remote -v
    origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
    origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
    upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
    upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)
```

Syncing a fork
(from https://help.github.com/articles/syncing-a-fork/)

Sync a fork of a repository to keep it up-to-date with the upstream repository.
Before you can sync your fork with an upstream repository, you must configure a remote that points to
 the upstream repository in Git.

Open Terminal.

Change the current working directory to your local project.

Fetch the branches and their respective commits from the upstream repository. Commits to master will be stored in a local branch, upstream/master.

```bash
    $ git fetch upstream
    remote: Counting objects: 75, done.
    remote: Compressing objects: 100% (53/53), done.
    remote: Total 62 (delta 27), reused 44 (delta 9)
    Unpacking objects: 100% (62/62), done.
    From https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY
     * [new branch]      master     -> upstream/master
```

Check out your fork's local master branch.

```bash
    $ git checkout master
    Switched to branch 'master'
```

Merge the changes from upstream/master into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes.

```bash
    $ git merge upstream/master
    Updating a422352..5fdff0f
    Fast-forward
     README                    |    9 -------
     README.md                 |    7 ++++++
     2 files changed, 7 insertions(+), 9 deletions(-)
     delete mode 100644 README
     create mode 100644 README.md
```

If your local branch didn't have any unique commits, Git will instead perform a "fast-forward":

```bash
    $ git merge upstream/master
    Updating 34e91da..16c56ad
    Fast-forward
     README.md                 |    5 +++--
     1 file changed, 3 insertions(+), 2 deletions(-)
```

---

## .gitignore

---

A `.gitignore` generator: [gitignore.io](gitignore.io)

---

Example Unity .gitignore, based on https://github.com/github/gitignore/blob/master/Unity.gitignore :

```bash
.DS_Store
# vi
.*.swp
*~
.idea

#
# Get latest from https://github.com/github/gitignore/blob/master/Unity.gitignore
#
/[Ll]ibrary/
/[Tt]emp/
/[Oo]bj/
/[Bb]uild/
/[Bb]uilds/
/[Ll]ogs/
/[Mm]emoryCaptures/

# Asset meta data should only be ignored when the corresponding asset is also ignored
!/[Aa]ssets/**/*.meta

# Uncomment this line if you wish to ignore the asset store tools plugin
# /[Aa]ssets/AssetStoreTools*

# Autogenerated Jetbrains Rider plugin
[Aa]ssets/Plugins/Editor/JetBrains*

# Visual Studio cache directory
.vs/

# Gradle cache directory
.gradle/

# Autogenerated VS/MD/Consulo solution and project files
ExportedObj/
.consulo/
*.csproj
*.unityproj
*.sln
*.suo
*.tmp
*.user
*.userprefs
*.pidb
*.booproj
*.svd
*.pdb
*.mdb
*.opendb
*.VC.db

# Unity3D generated meta files
*.pidb.meta
*.pdb.meta
*.mdb.meta

# Unity3D generated file on crash reports
sysinfo.txt

# Builds
*.apk
*.unitypackage

# Crashlytics generated file
crashlytics-build.properties

```

---

## Troubleshooting

See also [Undoing things](Git.md#undoing-things)

---

### error: RPC failed; HTTP 400 curl 22 The requested URL returned error: 400

Most likely, because of a 400k notebook file, had an error similar to this:

```bash
 % git push
Enumerating objects: ..., done.
Counting objects: 100% (...), done.
Delta compression using up to 8 threads
Compressing objects: 100% (...), done.

error: RPC failed; HTTP 400 curl 22 The requested URL returned error: 400

send-pack: unexpected disconnect while reading sideband packet
Writing objects: 100% (...), . MiB | . MiB/s, done.
Total ... (delta .), reused .. (delta .), pack-reused 0
fatal: the remote end hung up unexpectedly
Everything up-to-date
```

As per https://stackoverflow.com/questions/62753648/rpc-failed-http-400-curl-22-the-requested-url-returned-error-400-bad-request , tried:

```bash
    git config http.postBuffer 524288000
```

`pull/push`, and it helped, with a warning:

```bash
remote: warning: See https://gh.io/lfs for more information.
remote: warning: File ... is 80.00 MB; this is larger than GitHub's recommended maximum file size of 50.00 MB
remote: warning: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
```

---

## Miscellaneous

---

About sparse check-out, cloning a subdirectory.

https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository

---

Using a `no-repy` email for commits (making your email private)
https://dev.to/codewithfahad/github-tip-of-the-day-keep-your-commit-email-address-private-2eo2

Add `.patch` to the commit web link, and you will see the raw git commit info.

Update the email settings on the web in Settings.

A no-reply email is the user id plus `@users.noreply.github.com`

```bash
    $ git config --global user.email <your_noreply_email_address>
```

Verify it set ok:

```bash
    $ git config --global user.email
```

---

Insane collection of Github profile tricks.
https://github.com/abhisheknaiidu/awesome-github-profile-readme

Github profile activity generator
https://github.com/omidnikrah/profile-activity-generator

Static re-generation with Rust
https://dev.to/aralroca/static-readme-regeneration-4pf2

---

Custom Github profile
https://dev.to/rado_mayank/have-you-built-your-github-profile-readme-yet-27nh

---

Another example of using Github as host for a resume. Digital CV in Markdown on GitHub.
https://dev.to/carolstran/creating-a-digital-cv-in-markdown-on-github-1b3l

---

Switching from one default branch to another(`master` to `main`:
https://dev.to/swyx/move-primary-git-branch-from-master-to-main-m7c

TODO

---

Deleting tags (from https://stackoverflow.com/questions/5480258/how-to-delete-a-remote-tag)

You just need to push an 'empty' reference to the remote tag name:

```bash
    $ git push origin :tagname
```

Or, more expressively, use the --delete option (or -d if your git version is older than 1.8.0):

```bash
    $ git push --delete origin tagname
```

Note that git has tag namespace and branch namespace so you may use the same name for a branch and for a tag. If you want to make sure that you cannot accidentally remove the branch instead of the tag, you can specify full ref which will never delete a branch:

```bash
    $ git push origin :refs/tags/tagname
```

If you also need to delete the local tag, use:

```bash
    $ git tag --delete tagname
```

Background

Pushing a branch, tag, or other ref to a remote repository involves specifying "which repo, what source, what destination?"

```bash
    $ git push remote-repo source-ref:destination-ref
```

A real world example where you push your master branch to the origin's master branch is:

```bash
    $ git push origin refs/heads/master:refs/heads/master
```

Which because of default paths, can be shortened to:

```bash
    $ git push origin master:master
```

Tags work the same way:

```bash
    $ git push origin refs/tags/release-1.0:refs/tags/release-1.0
```

Which can also be shortened to:

```bash
    $ git push origin release-1.0:release-1.0
```

By omitting the source ref (the part before the colon), you push 'nothing' to the destination, deleting the ref on the remote end.

---

Github package manager:
https://help.github.com/en/github/managing-packages-with-github-packages/about-github-packages

---

Git commit guidelines:
https://chris.beams.io/posts/git-commit/

---

Another gui for git, SourceTree
https://www.sourcetreeapp.com/

---

Sometimes you need to run `apt-get update` to see git package. For example in a Dockerfile:

```dockerfile
    ...
    RUN apt-get update
    RUN apt-get -y install git
    ...
```

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

Utility `dos2unix` was handy for those pesky `"\r\n"` .

There were some issues with the credentials on Cygwin.

---

In `.gitignore`, to exclude a file from bing ignored, use `!filename`, for example:

```bash
    ...
    some_local_folder
    !some_local_folder/.git_keep
```

---

Normal cycle:

Fetch the repo:

```bash
    git clone [repo name]
```

Go to the branch you want to branch from, and create a feature branch
    
```bash
    git checkout -b featurebranch
```

Hack, hack, hack
When ready, commit the files into the remote feature branch:

```bash
    git add [files changed]
    git commit -m "implemented fieature x"
    git push
```

At the Github create the pull request.
When ready, at Github:
 - merge the pull request
 - delete the feature branch
 - delete local feature branch
    
---

The thing I often do to put the changes into the correct branch:

```bash
    hack hack hack
    $ git stash
    $ git checkout the_branch_i_want
    $ git stash pop
```

---

Example of starting a new repo from existing sources
           
```bash
    $ cd /path/to/the_project
    $ git init     
    $ git add .    
    $ git commit       

    $ mkdir tmp ; cd ~/tmp
    $ git clone file://localhost:/the_project
      Cloning into 'myproj'...
      warning: You appear to have cloned an empty repository.
      Checking connectivity... done.
```

---

Nice way to search:

```bash
    $ git grep -e "pattern" branch -- some/file

    $ git log --pickaxe-regex -S"some.*code.*change"
```

---

One way to set up a git-daemon (see another one below)
https://git-scm.com/book/en/v2/Git-on-the-Server-Git-Daemon

Create git group and git user (restrict them properly).
Crate folder `/srv/git/`
Create file `/etc/systemd/system/git-daemon.service`:

```
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
```

Run to automatically start the service on boot.
   
```bash
    $ systemctl enable git-daemon
```

To start:
    
```bash
    $ systemctl start git-daemon
```

Similar to stop, restart, etc.
If you edit the git-daemon.service file, you might run this to refresh the config:

```bash
    $ systemctl daemon-reload
```

In the repository you need to let the repo be exported:

```bash
    $ cd /path/to/
    $ git init --shared --bare project.git
    $ cd /path/to/project.git
    $ touch git-daemon-export-ok
```

In /etc/services there is a line for git-daemon port:

```
...
git             9418/tcp                        # Git Version Control System
...
```

To let others push into this repository, add to the git repository's config file:

```bash
    $ cd /path/to/project.git
    $ vi config
    
    ...
    [daemon]
    # UNSECURE anonymous Write access
        receivepack = true
    ...
```

---

This seems to be more useful:
https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server


---

If you write a script with name `git-somename`, and add it to PATH,
git will execute it when you run, for example:

```bash
    $ git somename arg1 arg2 whatever
```

---

Another neat trick to keep but not track a file. This will allow you to
get a local changes be ignored by git:

```bash
    $ git update-index --assume-unchanged Makefile
```

If you do want to push the local changes to that file, turn it back on:

```bash
    $ git update-index --no-assume-unchanged Makefile
    $ git add -p Makefile
     # ...
     # add the makefile shanges
     # ...
    $ git commit
    $ git update-index --assume-unchanged Makefile
    $ git push
```

---

There is a feature in git, to make easier merging:

```bash
    $ git config --global rerere.enabled true
```

It saves left and right for the merge and caches the resolution.

---

To completely remove a file from git repo.
(from here: https://dev.to/moshe/remove-accidentally-pushed-file-from-a-git-repository-history-in-4-simple-steps-18cg)

Step #1: Backup your repo!

```bash
    $ cp -r myproject backup
```

Step #2: Identify the commit that introduced the new file

e.g. for `client/public/favicons/red/hugefile.ova`

```bash
    $ git log client/public/favicons/red/hugefile.ova
    Sat Aug 17 19:16:17 2019 +0300 7ff66fa Add favicons  [Moshe Zada]
```

As you can see, it seems like commit 7ff66fa introduced the big file,
let's rewrite the history!

Step #3: Go back in time

```bash
    $ git rebase --interactive 7ff66fa~1
```

Right after running this command, your editor will open up with the
 commit history from 7ff66fa to the last commit, for example:

    pick 7ff66fa Add favicons
    pick 48d9cc0 Readme (#84)
    pick b9f23fd GitBook: [master] 17 pages modified
    pick 1e0f4f1 move to docs
    pick 23adabf GitBook: [master] 4 pages modified
    pick 237c792 revert readme
    pick 9418698 Continue reload if had exception
    pick 3723c3c Add Copy option to index
    pick 1ff0ec1 Add filter for manage aliases
    pick 8a8770d Better null message
    pick 4d8b64c Subscribe to input change
    pick 9bc31b6 Save more data for node stats
    pick 546e10b Small fixes
    # Rebase 5058e82..eafa06e onto 5058e82 (193 commands)
    #
    # Commands:
    # p, pick <commit> = use commit
    # r, reword <commit> = use commit, but edit the commit message
    # e, edit <commit> = use commit, but stop for amending
    # s, squash <commit> = use commit, but meld into previous commit
    # f, fixup <commit> = like "squash", but discard this commit's log message
    # x, exec <command> = run command (the rest of the line) using shell
    # b, break = stop here (continue rebase later with 'git rebase --continue')
    # d, drop <commit> = remove commit
    # l, label <label> = label current HEAD with a name
    # t, reset <label> = reset HEAD to a label
    # m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
    # .       create a merge commit using the original merge commit's
    # .       message (or the oneline, if no original merge commit was
    # .       specified). Use -c <commit> to reword the commit message.
    #
    # These lines can be re-ordered; they are executed from top to bottom.
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    #
    # However, if you remove everything, the rebase will be aborted.
    #
    # Note that empty commits are commented out

go to the first line, the one that starts with your git commit and change the
first word to the letter `e` - for edit (vimmiers: cwe<ESC>) and
exit your editor (:wq)

Step #4: Rewrite the history and push your changes

Now git will start replaying the last commits and give you shell
just before the bad commit delete the file:

```bash
    $ rm client/public/favicons/red/hugefile.ova
```

Add the change to git

```bash
    $ git add client/public/favicons/red/hugefile.ova
```

Commit and continue the rebase

```bash
    $ git commit --amend '-S' && git rebase --continue
```

Verify changes and force-push your changes

```bash
    $ git push --force
```

---

Nice cheat sheet (from here https://dev.to/usmslm102/git-cheat-sheet-4f5a)

Initialize local git repository

```bash
    $ git init
```

Check files to commits and branch name
    
```bash
    $ git status
```

add files to staging area.

```bash
    $ git add FileName.txt
```

add all modified and new files to staging area

```bash
    > git add -all
```

add all files of directory to staging area

```bash
    > git add folder/
```

Commit changes to local repository

```bash
    > git commit -m "Message to commit"
```

history of commits

```bash
    > git log --
```

Get help for any command

```bash
    > git help <Command>
```

set global user name

```bash
    > git config --global user.name "Name"
```

Show un-staged differences since last commit

```bash
    > git diff
```

View staged differences

```bash
    > git diff --staged
```

Un-stage files and HEAD Refers to last commit

```bash
    > git reset HEAD FileName
```

Blow away all changes since last commit

```bash
    > git checkout -- FileName
```

SKIP STAGING AND COMMIT and Add changes from all tracked files. this Doesn’t add new (untracked) files

```bash
    > git commit -a -m "Modify readme"
```

Reset into staging and Move to commit before ‘HEAD’

```bash
    > git reset --soft HEAD^
```

Add to the last commit with new commit message

```bash
    > git commit --amend -m "New Message"
```

Undo last commit and all changes

```bash
    > git reset --hard HEAD^
```

Undo last 2 commits and all changes

```bash
    > git reset --hard HEAD^^
```

ADDING A REMOTE

```bash
    $ git remote add <name>origin <address>https://giturl
```

show remote repositories

```bash
    $ git remote -v
```

To push to remotes

```bash
    $ git push -u <name>origin <branch>master
```

Remove remote

```bash
    $ git remote rm <name>
```

Clone remote repository

```bash
    $ git clone <address>https://giturl
```

Create branch

```bash
    $ git branch <BrancName>
```

create and checkout branch

```bash
    $ git checkout -b <BrancName>
```

list available branches

```bash
    $ git branch
```

list remote available branches

```bash
    $ git branch -r
```

Switching between branches

```bash
    $ git checkout <branch name>
```

merge 2 branches

```bash
    $ git merge <branch name>
```

Delete branch

```bash
    $ git branch -d <branch name>
```

Force delete branch

```bash
    $ git branch -D <branch name>
```

get remote changes

```bash
    $ git pull
```

get the remote changes to local remote branch

```bash
    $ git fetch
```

merge local remote branch changes to local master branch
 
```bash
    $ git merge <local branch>
```

shows branches alignments

```bash
    $ git remote show origin
```

remove remote branch

```bash
    $ git push origin :<branch name>
```

To clean up deleted remote branches

```bash
    $ git remote prune origin
```

List all tags

```bash
    $ git tag
```

Create tag

```bash
    $ git tag -a <Tag Name> -m "Tag message"
```

Push new tags to remote

```bash
    $ git push --tags
```

Revert to existing tag.

```bash
    $ git checkout <tag name>
```

---

To push from a different account without config(if password matters, skip it to enter separately):

```bash
    $ git push https://username:password@github.com/username/reponame.git
```

---

To cache the password for operations over https:

https://www.tecmint.com/fix-git-user-credentials-for-https

And this discussion is also useful:
https://stackoverflow.com/questions/14762034/push-to-github-without-a-password-using-ssh-key

And, maybe this:
https://medium.com/@amanze.ogbonna/accessing-pushing-to-github-without-username-and-password-3022feb077fb

---

Another intro to Git. Simple examples.
https://dev.to/john2220/basic-git-commands-you-should-know-51ij

---

Creating GitHub repo using only CLI

https://medium.com/@alexbuzunov/locked-out-how-to-create-a-github-repo-using-only-the-cli-c7fb24a49c00

---
