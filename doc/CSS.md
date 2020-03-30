# Cascading Style Sheet

---

border-collapse properdy demo
https://developer.mozilla.org/en-US/docs/Web/CSS/border-collapse

more about CSS:
https://www.w3schools.com/html/html_css.asp
https://www.w3schools.com/css/css_howto.asp

---

Intro to CSS Cascade - the "C" in CSS.
https://dev.to/5t3ph/intro-to-the-css-cascade-the-c-in-css-1kh0

---

Nice environmtnt to try things out.
https://www.w3schools.com/css/tryit.asp?filename=trycss_default

---

Example of defining CSS in a separate file:

    <!DOCTYPE html>
    <html>
    <head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>
    <body>
  
    <h1>This is a heading</h1>
    <p>This is a paragraph.</p>
    
    </body>
    </html>
    
The content of `mystyle.css`:

    body {
      background-color: lightblue;
    }
    
    h1 {
      color: navy;
      margin-left: 20px;
    }    

Or, internal CSS:

    <!DOCTYPE html>
    <html>
    <head>
    <style>
    body {
      background-color: linen;
    }
    
    h1 {
      color: maroon;
      margin-left: 40px;
    }
    </style>
    </head>
    <body>
    
    <h1>This is a heading</h1>
    <p>This is a paragraph.</p>
    
    </body>
    </html>

Inline CSS:

    <!DOCTYPE html>
    <html>
    <body>
    
    <h1 style="color:blue;text-align:center;">This is a heading</h1>
    <p style="color:red;">This is a paragraph.</p>
    
    </body>
    </html>    
    

If you have multipls style sheets, whichever is the latest, is overwriting the previous.    

---