# Angular

---

To have automatic building:

    $ ng build --watch

---

Securing Angular Apps with OpenID Connect and OAuth 2, By Brian Noyes :
https://app.pluralsight.com/course-player?courseId=7f9a2bbe-1cbb-4597-a954-a8205b1f28be

A short one on Angular basics:
Learning Angular from Scratch, By John Papa :
https://app.pluralsight.com/course-player?courseId=3086c447-5852-4ac1-b819-10af979a2da6

---

To fix the local angular cli version not matching global, these helped.

(https://stackoverflow.com/questions/50415235/how-to-change-upgrade-or-downgrade-angular-version)

    $ npm install -g @angular/cli       ß----------- installed global version.
    $ npm uninstall -g angular-cli
    $ npm cache clean
    $ npm install -g angular-cli@1.6.1

Or, maybe in combination with these:
(from https://www.freakyjolly.com/how-to-update-local-angular-cli-version/)

    # Install npm-check-updates
    $ npm i -g npm-check-updates

    # Run npm-check-updates with -u, will upgrade package.json
    $ ncu -u
 
    # Install updated packages
    $ npm install

After running $ ncu  you can check updated versions available.

To specify a version of a package, you can do this:
     
    $ npm install typescript@3.5.3

---
