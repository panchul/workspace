# curl

See Also:

  - `http`(utility)

---

Interesting way to get the id, a snippet from a pipelineing script for kubeflow
https://www.kubeflow.org/docs/pipelines/tutorials/api-pipelines/

    RUN_ID=$((
    curl -H "Content-Type: application/json" -X POST ${SVC}/apis/v1beta1/runs \
    -d @- << EOF
    {
       "name":"${PIPELINE_NAME}_run",
       "pipeline_spec":{
          "pipeline_id":"${PIPELINE_ID}"
       }
    }
    EOF
    ) | jq -r .run.id)
    


---

libcurl install summary:
https://unix.stackexchange.com/questions/452515/how-to-install-libcurl

For Mac worked simple:

    $ brew install curl

Includes are in `/usr/local/opt/curl/include`, the libs are in `lib`

---

HTTP Evasions Explained - Part 1 - Evading Using HTTP 0.9 
https://noxxi.de/research/http-evader-explained-1-http09.html

---

For JSON, here's a convenient followup for curl:

    $ curl http://some_api_url/ | python -m json.tool
   
This last one might get crapped up with the ```curl```'s progress bar, to keep it silent:
    
    $ curl -s http://some_api_url/ | python -m json.tool

(`-s` or `--silent` is the quiet mode, no progress bar).
    
---

to fetch and build on Mac, `brew install` would be sufficient. 

---

POST HTTP request example:

    $ curl -H "Content-Type: application/json" -X POST -d '{"name":"Something","author":"Someody"}' localhost:8181/Books

It can infer that it is a POST, so it is same as:

    $ curl -H "Content-Type: application/json" -d '{"name":"Something","author":"Someody"}' localhost:8181/Books

If the server can figure out the content type, you can drop that too:

    $ curl localhost:8181/Books -d '{"name":"Something","author":"Someody"}'

---

`--version` shows the supported protocols:
    
    $ curl --version
    curl 7.47.0 (x86_64-pc-linux-gnu) libcurl/7.47.0 GnuTLS/3.4.10 zlib/1.2.8 libidn/1.32 librtmp/2.3
    Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp smb smbs smtp smtps telnet tftp
    Features: AsynchDNS IDN IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP UnixSockets
    
---
    
    $ curl -O http://yourdomain.com/yourfile.tar.gz # Save as yourfile.tar.gz
    $ curl -o newfile.tar.gz http://yourdomain.com/yourfile.tar.gz # Save as newfile.tar.gz

---
      
Option `-C -` allows resuming previously-interrupted download:

    $ curl -C - -O http://yourdomain.com/yourfile.tar.gz
    ^C
    $ curl -O http://yoursite.com/info.html -O http://mysite.com/about.html
     
---

Using lists of files:
      
    $ cat listurls.txt
    https://somedomain.com/file1.html
    https://somedomain.com/file2.html
    $ xargs -n 1 curl -O < listurls.txt
    
---     

Use Proxy with or without Authentication

    $ curl -x proxy.yourdomain.com:8080 -U user:password -O http://yourdomain.com/yourfile.tar.gz
    $ curl -x proxy.yourdomain.com:8080 -O http://yourdomain.com/yourfile.tar.gz
    
---
    
Getting headers:

    $ curl -I www.tecmint.com
    
---
    
Making a POST request(emulates an html form):

    $ curl --data "firstName=John&lastName=Doe" https://yourdomain.com/info.php

---
    
Downloading from FTP server:

    $ curl -u username:password -O ftp://yourftpserver/yourfile.tar.gz
    
Uploading to FTP server:

    $ curl -u username:password -T mylocalfile.tar.gz ftp://yourftpserver
    
---
    
Specifying the user agent(it is "curl/version" by default:

    $ curl -I http://localhost --user-agent "I am a new web browser"
    
---
    
Storing cookies:

    $ curl --cookie-jar cnncookies.txt https://www.cnn.com/index.html -O
     
Using cookies:

    $ curl --cookie cnncookies.txt https://www.cnn.com
    
---
    
Resolving domain names to alternatives(Good for debugging):

    $ curl --resolve www.yourdomain.com:80:localhost http://www.yourdomain.com/
    
---

Limiting download bandwidth:

    $ curl --limit-rate 100K http://yourdomain.com/yourfile.tar.gz -O
    
---
