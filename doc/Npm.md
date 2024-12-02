[Home](Readme.md)
# npm

See Also:

 - [Git](Git.md)
 - [Gulp](Gulp.md)
 - [Mercurial](Mercurial.md)
 - [NodeJs](NodeJs.md)
 - [Nvm](Nvm.md)
 - [Subversion](Subversion.md)
 
`npm` (Node package manager) is a software registry. It is installed with Node.js.
`npm` includes a cli that can be used to download and install packages.

**Contents**

- [Installing](Npm.md#installing)
- [Creating a package](Npm.md#creating-a-package)
- [Deploying](Npm.md#deploying)
- [Miscellaneous](Npm.md#miscellaneous)

---

## Installing 

---

Install it via [nvm](Nvm.md):

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Node.js v22.11.0 is latest LTS. So,

```bash
% nvm install 22.11.0

Downloading and installing node v22.11.0...
Downloading https://nodejs.org/dist/v22.11.0/node-v22.11.0-darwin-arm64.tar.xz...
######################################################################### 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v22.11.0 (npm v10.9.0)
Creating default alias: default -> 22.11.0 (-> v22.11.0)
```

And activate it:

```bash
% nvm use 22.11.0
Now using node v22.11.0 (npm v10.9.0)
```

---

## Creating a package

---

Some basics of npm and npx
https://dev.to/bogicevic7/npm-vs-npx-which-to-use-when-2hob

e.g.

```bash
    $ npm init -y
    
    $ npm i [some package name]
```

To add eslint, for example, do this:

```bash
    $ npm i eslint
```

Now can run it like so:
    
```bash
    $ ./node_module/.bin/eslint --init
```

or, better:    
    
```bash
    $ npx eslint --init
```

This will install globally:    
    
```bash
    $ npm install -g eslint
```

---

## Deploying

---

About `package-lock.json`

https://stackoverflow.com/questions/44206782/do-i-commit-the-package-lock-json-file-created-by-npm-5

Yes, you SHOULD:

- commit the `package-lock.json`.
- use npm ci instead of npm install when building your applications both on your CI and your local development machine

The npm ci workflow requires the existence of a package-lock.json.

---

About `npm run build`, vs `npm install`, vs `npm start`:

https://stackoverflow.com/questions/43664200/what-is-the-difference-between-npm-install-and-npm-run-build

`npm install`: installs dependencies, then calls the install from the package.json scripts field.

`npm run build`: runs the build field from the package.json scripts field.

---

To specify a port, other than default ( 3000 ):

```bash
npm start -- --port 8000
```

Actually, you can modify in package.json:

```json
"start": "PORT=3001 react-scripts start",
"start-pc": "set PORT=3001&& react-scripts start",
```

Than on mac:

```bash
npm start
```

On pc:

```bash
npm run start-pc
```

---

## Miscellaneous

---

How to publish an npm package to npm and GitHub Package Registry simultaneously using GitHub Actions
https://dev.to/joeattardi/how-to-publish-an-npm-package-to-npm-and-github-package-registry-simultaneously-using-github-actions-213a

---

How to use a private git repo as an npm module
(from here: https://dev.to/gate3/how-to-use-a-private-git-repo-as-an-npm-module-2cl9)

---
