

## UNDER CONSTRUCTION

# Burrow

https://github.com/linkedin/Burrow

---

Wants Dep as a pre-requisite:

https://github.com/golang/dep

---

Keep getting this crap:

```
{"level":"panic","ts":1543870076.1354005,"msg":"Failed to compile TemplateOpen","type":"coordinator","name":"notifier","error":"open conf/default-http-post.tmpl: no such file or directory","module":"default"}
{"level":"panic","ts":1543870076.1354086,"msg":"Failed to compile TemplateOpen"}
```

https://dzone.com/articles/kafka-monitoring-with-burrow

---

For the Docker-Compose version, here's how to resolve Dockerfile bug:
https://github.com/linkedin/Burrow/issues/222

Adding this to the Dockerfile helped:

    ...
    RUN go get github.com/klauspost/crc32
    ...

---

