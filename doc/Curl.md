

## UNDER CONSTRUCTION

# curl

---

For JSON, here's a convenient followup for curl:

    $ curl http://some_api_url/ | python -m json.tool
   
This last one might get crapped up with the ```curl```'s progress bar, to keep it silent:
    
    $ curl -s http://some_api_url/ | python -m json.tool
    
---
