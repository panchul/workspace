# Node

Nodejs.org

---

Introduction to Web Scraping with Nodejs
https://dev.to/iamnotstatic/introduction-to-web-scrapping-with-nodejs-208g

    $ mkdir web-scraper 
    $ cd web-scraper
    $ npm init
    $ npm install axios
    $ npm install cheerio

Create `app.js`:

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

Run is like so:

    $ node app.js

Now, similarly, filter out the files we want:

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

Runing it:

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
    
---

Making concurrent API calls in Node
https://dev.to/yuesu/making-concurrent-api-calls-in-node-3deg

The NASA repo they are using: https://github.com/yue-su/get-nasa-photo

---

Quick into, basics of Socket.io
https://dev.to/uf4no/understanding-the-basics-of-socket-io-3a0e

---

Nice Udemy course with a lot of useful info.
https://www.udemy.com/course/nodejs-the-complete-guide/

---
