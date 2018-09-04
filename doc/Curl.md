

## UNDER CONSTRUCTION

# curl
See Also:
    `http`(utility)

---

For JSON, here's a convenient followup for curl:

    $ curl http://some_api_url/ | python -m json.tool
   
This last one might get crapped up with the ```curl```'s progress bar, to keep it silent:
    
    $ curl -s http://some_api_url/ | python -m json.tool
    
---

to fetch and build on Mac, ```brew install``` would be sufficient. 

---

POST HTTP request example:

    $ curl -H "Content-Type: application/json" -X POST -d '{"name":"Something","author":"Someody"}' localhost:8181/Books

It can infer that it is a POST, so it is same as:

    $ curl -H "Content-Type: application/json" -d '{"name":"Something","author":"Someody"}' localhost:8181/Books

And if the server can figure out the content type, you can drop that too:

    $ curl localhost:8181/Books -d '{"name":"Something","author":"Someody"}'

---