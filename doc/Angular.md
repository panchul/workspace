[Home](Readme.md)
# Angular

See Also:

  - [Flutter](Flutter.md)
  - [MEAN Stac](MEANStack.md)
  - [NodeJs](NodeJs.md)
  - [Npm](Npm.md)
  - [ReactJs](ReactJs.md)
  - [Other frameworks](Readme.md#web-frameworks-servers-etc)


[https://angular.dev/](https://angular.dev/)


---

**Contents**

- [Installing](Angular.md#installing)
- [Tutorials](Angular.md#tutorials)
- [Miscellaneous](Angular.md#miscellaneous)

---

## Installing

---

Prerequisite: [Node.js](NodeJs.md)


Clean Getting Started is, using [npm](Npm.md):

```bash
npm install -g @angular/cli
```

and to create a new project:

```bash
ng new <project-name>
```

then cd to that folder, and

```bash
npm start
```

You will have the app running on the localhost, with port it says (probably 4200)

---

To fix the local angular cli version not matching global, these helped.

(https://stackoverflow.com/questions/50415235/how-to-change-upgrade-or-downgrade-angular-version)

```bash
    $ npm install -g @angular/cli       <----------- installed global version.
    $ npm uninstall -g angular-cli
    $ npm cache clean
    $ npm install -g angular-cli@1.6.1
```

Or, maybe in combination with these:
(from https://www.freakyjolly.com/how-to-update-local-angular-cli-version/)

```bash
    # Install npm-check-updates
    $ npm i -g npm-check-updates

    # Run npm-check-updates with -u, will upgrade package.json
    $ ncu -u
 
    # Install updated packages
    $ npm install
```

After running $ ncu  you can check updated versions available.

To specify a version of a package, you can do this:
     
```bash
    $ npm install typescript@3.5.3
```

---

## Tutorials

---

MEAN stack example, Angular.js and other stuff https://www.djamware.com/post/5a0673c880aca7739224ee21/mean-stack-angular-5-crud-web-application-example

---

Securing Angular Apps with OpenID Connect and OAuth 2, By Brian Noyes :
https://app.pluralsight.com/course-player?courseId=7f9a2bbe-1cbb-4597-a954-a8205b1f28be

A short one on Angular basics:
Learning Angular from Scratch, By John Papa :
https://app.pluralsight.com/course-player?courseId=3086c447-5852-4ac1-b819-10af979a2da6

---

## Miscellaneous

---

To have automatic building:

```bash
    $ ng build --watch
```
