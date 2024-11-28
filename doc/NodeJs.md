[Home](Readme.md)
# Node Js

See Also:

 - [GoogleCloud(GCP)](GoogleCloud.md)
 - [Javascript](Javascript.md)
 - [ReactJs](ReactJs.md)
 - [TypeScript](TypeScript.md)

[Nodejs.org](https://nodejs.org)

---

**Contents**

- [Installing](NodeJs.md#installing)
- [Popular packages](NodeJs.md#popular-packages)
- [Tutorials](NodeJs.md#tutorials)
- [Miscellaneous](NodeJs.md#miscellaneous)

---

## Installing 

---

The prefered way is to use [`nvm`](Nvm.md). E.g. for 22.11.0 LTS:

```bash
% nvm install 22.11.0
% nvm use 22.11.0
Now using node v22.11.0 (npm v10.9.0)
```

---

Use `nodemon` to not need restarting a node app all the time.

To install globally using [`npm`](Npm.md):

```bash
sudo npm i -g nodemon
```

and then

```bash
sudo nodemon index.js
```

---

## Popular packages

---

`joi` - for schema validation


---

## Tutorials

---

Crash course
https://www.youtube.com/watch?v=ENrzD9HAZK4

---

Node.js Crash Course Tutorial

https://www.youtube.com/watch?v=zb3Qk8SG5Ms&list=PL4cUxeGkcC9jsz4LDYc6kv3ymONOKxwBU

---

1 hour intro to NodeJs
https://www.youtube.com/watch?v=TlB_eWDSMt4

1 hour How to build a REST API with Node js & Express
https://www.youtube.com/watch?v=pKd0Rpw7O48

---

Quick into, basics of Socket.io
https://dev.to/uf4no/understanding-the-basics-of-socket-io-3a0e

---

Nice Udemy course with a lot of useful info.
https://www.udemy.com/course/nodejs-the-complete-guide/

---

## Miscellaneous

---

Introduction to Web Scraping with Nodejs
https://dev.to/iamnotstatic/introduction-to-web-scrapping-with-nodejs-208g

```bash
    $ mkdir web-scraper 
    $ cd web-scraper
    $ npm init
    $ npm install axios
    $ npm install cheerio
```

Create `app.js`:

```Javascript
    const axios = require("axios");
    const cheerio = require("cheerio");
    const url = "https://stackoverflow.com/jobs";
    (async () => {
    try {
        const res = await axios.get(url);
        const html = res.data;
            //loading response data into a Cheerio instance
            const $ = cheerio.load(html);
            const siteName = $(".-logo").text();
            // This would return the site Name
            console.log(siteName);
        } catch (error) {
            console.log(error);
        }
    })();
```

Run is like so:

```bash
    $ node app.js
```

Now, similarly, filter out the files we want:

```Javascript
    const axios = require("axios");
    const cheerio = require("cheerio");
    const url = "https://stackoverflow.com/jobs";
    (async () => {
        try {
            const res = await axios.get(url);
            const html = res.data;

            //loading response data into a Cheerio instance
            const $ = cheerio.load(html);

            $('.fl1').each((i, el) => {
                const title = $(el).find('.fs-body3').text().replace(/s\s+/g, '');
                const link = $(el).find('.s-link').attr('href');
                const date = $(el).find('.fc-orange-400').text();
                const data = {
                    title,
                    link: `https://stackoverflow.com/${link}`,
                    date
                }
                console.log(data);
            });

        } catch (error) {
            console.log(error);
        }
    })();
```

Runing it:

```bash
    $ node app.js
    {
    title: '\nFull-Stack Software Engineer            ',
    link: 'https://stackoverflow.com//jobs/471179/full-stack-software-engineer-unhedged',
    date: '5d ago'
    }
    {
    title: '\nSoftware Engineering            ',
    link: 'https://stackoverflow.com//jobs/473617/software-engineering-jpmorgan-chase-bank-na',
    date: '5h ago'
    }
    {
    title: '\nSenior Software Engineer (Backend) (m/w/d)            ',
    link: 'https://stackoverflow.com//jobs/471126/senior-software-engineer-backend-m-w-d-gp-9000-gmbh',
    date: '7d ago'
    }
    {
    title: '\nSenior Backend Engineer Who LoveTypescript            ',
    link: 'https://stackoverflow.com//jobs/470542/senior-backend-engineer-who-loves-typescript-well-health-inc',
    date: '6d ago'
    }
    {
    title: '\nJava Developer - Software Engineering            ',
    link: 'https://stackoverflow.com//jobs/473621/java-developer-software-engineering-jpmorgan-chase-bank-na',
    date: '5h ago'
    }
    {
    title: '\nSenior Software Engineer            ',
    link: 'https://stackoverflow.com//jobs/473494/senior-software-engineer-nori',
    date: '7h ago'
    }
```
    
---

Making concurrent API calls in Node
https://dev.to/yuesu/making-concurrent-api-calls-in-node-3deg

The NASA repo they are using: https://github.com/yue-su/get-nasa-photo
