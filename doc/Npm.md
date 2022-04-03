# npm

See Also:
 - [Mercurial](Mercurial.md)
 - [Subversion](Subversion.md)
 - [Git](Git.md)
 - [Gulp](Gulp.md)


npm (Node package manager) is a software registry. It is installed with Node.js.
npm includes a cli that can be used to download and install packages.

---

Some basics of npm and npx
https://dev.to/bogicevic7/npm-vs-npx-which-to-use-when-2hob

e.g.

    $ npm init -y
    
    $ npm i [some package name]

To add eslint, for example, do this:

    $ npm i eslint

Now can run it like so:
    
    $ ./node_module/.bin/eslint --init
    
or, better:    
    
    $ npx eslint --init

This will install globally:    
    
    $ npm install -g eslint

---

How to publish an npm package to npm and GitHub Package Registry simultaneously using GitHub Actions
https://dev.to/joeattardi/how-to-publish-an-npm-package-to-npm-and-github-package-registry-simultaneously-using-github-actions-213a

---

How to use a private git repo as an npm module
(from here: https://dev.to/gate3/how-to-use-a-private-git-repo-as-an-npm-module-2cl9)




---