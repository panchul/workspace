[Home](Readme.md)
# JavaScript

See Also:

 - [GoogleCloud(GCP)](GoogleCloud.md)
 - [NodeJs](NodeJs.md)
 - [TypeScript](TypeScript.md)
 - [Zustand](Zustand.md)

A sandbox with some templates:
[https://github.com/panchul/sb_javascript](https://github.com/panchul/sb_javascript)

[https://www.javascript.com/](https://www.javascript.com/)

**Contents**

  - [Installing](Javascript.md#installing)
  - [Tutorials](Javascript.md#tutorials)
  - [Callbacks](Javascript.md#callbacks)
  - [Persistence](Javascript.md#persistence)
  - [Miscellaneous](Javascript.md#miscellaneous)

---

## Installing 

---

Don't have to, works in browsers. Can install [node](NodeJs.md), etc.

---

## Tutorials

---

Neat overview and spec:

developer.mozilla.org/en-US/docs/Web/JavaScript

---

## Callbacks

---

[Plotly](PlotlyDash.md) and Javascript, not very good, but has some info:

https://youtu.be/qh4Lg1X_k1A 

---


```Python
import dash
from dash import dcc, html, Input, Output
from dash.exceptions import PreventUpdate

app = dash.Dash(__name__)

app.layout = html.Div([
    dcc.Input(id='input-1', type='text', value=''),
    html.Div(id='output-1')
])

@app.callback(
    Output('output-1', 'children'),
    Input('input-1', 'value')
)
def update_output(value):
    if not value:
        raise PreventUpdate
    return f'You entered: {value}'

if __name__ == '__main__':
    app.run_server(debug=True)
```

---


My fork of this nice guy's repo(his videos are awesome):
https://github.com/panchul/Dash-by-Plotly

And somebody he references too: https://github.com/leberber

A more elaborate code for Javascript callbacks:

https://github.com/panchul/dashJsLibraries

---

## Persistence

---

One of the options is [Zustand](Zustand.md)

---  
  
## Miscellaneous

---

Neat sample projects with variety of features.
https://dev.to/behnamazimi/collection-of-simple-web-projects-532f

A minimalistic web portfolio source codes
https://dev.to/sivaneshs/a-minimalistic-web-portfolio-for-all-devs-37gh

---

11 ways to iterate an array in Javascript
https://dev.to/misterkevin_js/11-ways-to-iterate-an-array-javascript-3mjg

---

Another Javascript framework:
https://github.com/sveltejs

Here's how to create a TODO app with this:
https://dev.to/areknawo/making-a-todo-app-in-svelte-57l3

---

Simple fizzBuzz solution

```Javascript
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
```

---

A simple slider in html/.css/javascript:
https://dev.to/ibrahima92/fullscreen-slider-with-html-css-and-javascript-4odn

---
