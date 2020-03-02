# JavaScript

A sandbox with some templates:
[https://github.com/panchul/sb_javascript](https://github.com/panchul/sb_javascript)

[https://www.javascript.com/](https://www.javascript.com/)

---

Another Javascript framework:
https://github.com/sveltejs

Here's how to create a TODO app with this:
https://dev.to/areknawo/making-a-todo-app-in-svelte-57l3

---

Simple fizzBuzz solution

    function fizzBuzz(n) {
    
     if (isNaN(n) || !Number.isInteger(n) || n < 1) return null;
    
     let output = [];
    
     for (let i = 1; i <= n; i++) {
      if (i % 3 === 0 && i % 5 === 0) {
       output.push(“fizzbuzz”);
      } else if (i % 3 === 0) {
       output.push(“fizz”);
      } else if (i % 5 === 0) {
       output.push(“buzz”);
      } else {
       output.push(i);
      }
     }
     
     return output;
    }

---

A simple slider in html/.css/javascript:
https://dev.to/ibrahima92/fullscreen-slider-with-html-css-and-javascript-4odn

---