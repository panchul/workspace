

## UNDER CONSTRUCTION

# JavaScript



A sandbox with some templates:
[https://github.com/panchul/sb_javascript](https://github.com/panchul/sb_javascript)


[https://www.javascript.com/](https://www.javascript.com/)


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