[Home](Readme.md)
# Laravel

See Also:

- [CocoaPods](CocoaPods.md)
- [Django](Django.md)
- [Express Js](ExpressJs.md)
- [Flutter](Flutter.md)
- [Gunicorn](Gunicorn.md)
- [MEAN Stack](MEANStack.md)
- [Nginx](Nginx.md)
- [Php](Php.md)


[https://laravel.com](https://laravel.com)


---

*Contents*

- [Installing](Laravel.md#installing)
- [Tutorials](Laravel.md#tutorials)
- [Herd](Larave.md#herd)
- [Miscellaneous](Laravel.md#miscellaneous)
- [Links](Laravel.md#links)

---

## Installing

---

See [Php installing](Php.md#installing), that installs Composer and Laravel too.

---

Getting Started

https://laravel.com/docs/11.x

---

## Tutorials

---

As per https://laravel.com/docs/11.x/installation#creating-a-laravel-project:

```bash
$ laravel new example-app
```

It creates all the boiler plate code, giving options. For example:

```bash
  _                               _
  | |                             | |
  | |     __ _ _ __ __ ___   _____| |
  | |    / _` | '__/ _` \ \ / / _ \ |
  | |___| (_| | | | (_| |\ V /  __/ |
  |______\__,_|_|  \__,_| \_/ \___|_|


 ┌ Would you like to install a starter kit? ────────────────────┐
 │ Laravel Breeze                                               │
 └──────────────────────────────────────────────────────────────┘

 ┌ Which Breeze stack would you like to install? ───────────────┐
 │ Blade with Alpine                                            │
 └──────────────────────────────────────────────────────────────┘

 ┌ Would you like dark mode support? ───────────────────────────┐
 │ Yes                                                          │
 └──────────────────────────────────────────────────────────────┘

 ┌ Which testing framework do you prefer? ──────────────────────┐
 │ Pest                                                         │
 └──────────────────────────────────────────────────────────────┘
```

Then you can build:

```bash
example-app % npm install && npm run build

added 1 package, and audited 170 packages in 382ms

40 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

> build
> vite build

vite v5.4.11 building for production...
✓ 54 modules transformed.
public/build/manifest.json             0.27 kB │ gzip:  0.15 kB
public/build/assets/app-BETWqZgd.css  38.24 kB │ gzip:  6.92 kB
public/build/assets/app-BPnfBaih.js   79.37 kB │ gzip: 29.63 kB
✓ built in 334ms
```


```bash
example-app % composer run dev
> Composer\Config::disableProcessTimeout
> npx concurrently -c "#93c5fd,#c4b5fd,#fb7185,#fdba74" "php artisan serve" "php artisan queue:listen --tries=1" "php artisan pail --timeout=0" "npm run dev" --names=server,queue,logs,vite
[queue] 
[queue]    INFO  Processing jobs from the [default] queue.  
[queue] 
[logs] 
[logs]    INFO  Tailing application logs.                        Press Ctrl+C to exit  
[logs]                                                Use -v|-vv to show more details  
[vite] 
[vite] > dev
[vite] > vite
[vite] 
[vite] 
[vite]   VITE v5.4.11  ready in 82 ms
[vite] 
[vite]   ➜  Local:   http://localhost:5173/
[vite]   ➜  Network: use --host to expose
[vite] 
[vite]   LARAVEL v11.34.2  plugin v1.1.1
[vite] 
[vite]   ➜  APP_URL: http://localhost
[server] 
[server]    INFO  Server running on [http://127.0.0.1:8000].  
[server] 
[server]   Press Ctrl+C to stop the server
```

Now http://127.0.0.1:8000 has a nice web server.


---

https://bootcamp.laravel.com/deploying

---

## Herd

---

https://herd.laravel.com/

---

## Miscellaneous

---


## Links

- ...
