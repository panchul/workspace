# HTML

---

Many ways to disable caching.
http://cristian.sulea.net/blog/disable-browser-caching-with-meta-html-tags/

In the .html itself, in the header you can put these:

    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

---

Some into in DOM manipulation
https://dev.to/iqramqra/a-beginners-guide-to-dom-manipulation-45bk

---

Nice refresher:
https://www.w3schools.com/html/default.asp

---

Example of the HTML with geolocation:

    <!DOCTYPE html>
    <html>
    <body>
    
    <p>Click the button to get your coordinates.</p>
    
    <button onclick="getLocation()">Try It</button>
    
    <p id="demo"></p>
    
    <script>
    var x = document.getElementById("demo");
    
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else { 
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }
    
    function showPosition(position) {
        x.innerHTML = "Latitude: " + position.coords.latitude + 
        "<br>Longitude: " + position.coords.longitude;
    }
    </script>
    
    </body>
    </html>

---

Auto-refreshing via meta setting in the header:

    <head>
       <meta http-equiv="refresh" content="30>
    </head>

---

