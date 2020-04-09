# Kubenetes

https://kubernetes.io/

See Also:

    - [Kubeflow](Kubeflow.md)


Installing kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl/

---

Top 50 Kubernetes Interview questions
https://www.edureka.co/blog/interview-questions/kubernetes-interview-questions/

---

Kubernetes cluster on CentOS 8
https://www.tecmint.com/install-a-kubernetes-cluster-on-centos-8/

Kubernetes cluster on CentOS 7
https://www.tecmint.com/install-kubernetes-cluster-on-centos-7/

---

Docker on Windows:
https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon

Kubernetes on Windows:
https://docs.microsoft.com/en-us/virtualization/windowscontainers/kubernetes/getting-started-kubernetes-windows

---

About best practices. Organizing with Namespaces.
https://cloudplatform.googleblog.com/2018/04/Kubernetes-best-practices-Organizing-with-Namespaces.html

---

A few point why Kubernetes is nice:
https://www.linux.com/blog/top-5-reasons-love-kubernetes
https://www.linux.com/blog/5-more-reasons-love-kubernetes

---

Some comparisons with the competitors, a bunch of bullet points
https://www.youtube.com/watch?v=C_u4_l84ED8

---

Quick getting-started, kicking-the-tires example.
https://kubernetes.io/docs/getting-started-guides/minikube/

---

Just recording a sandbox kicking-the-tires example. I think it was from the links below:
https://kubernetes.io/docs/getting-started-guides/minikube/
https://kubernetes.io/docs/tasks/tools/install-kubectl/

Getting kubectl

    $ cd tmp
    $ curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stabl
e.txt)/bin/darwin/amd64/kubectl

Installing kubectl (or just ```brew install kubectl``` on MacOS)

    $ chmod +x ./kubectl
    $ sudo mv ./kubectl /usr/local/bin/kubectl
    $ kubectl cluster-info
    $ kubectl cluster-info dump
    
Optional, creating the config file    

    $ cd ~
    $ mkdir .kube
    $ cd .kube
    $ touch config
    
Getting and running Minikube, a CLI tool that provisions and manages single-node Kubernetes clusters optimized for development workflows.

    $ curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.21.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
    
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                   Dload  Upload   Total   Spent    Left  Speed
    100 81.9M  100 81.9M    0     0  6845k      0  0:00:12  0:00:12 --:--:-- 6519k

    $ minikube
    [here goes help, read it]
     
    $ minikube status
    
    minikube: Stopped
    localkube: 
    kubectl: 

    $ minikube start
    
    Starting local Kubernetes v1.7.0 cluster...
    Starting VM...
    Getting VM IP address...
    Moving files into cluster...
    Setting up certs...
    Starting cluster components...
    Connecting to cluster...
    Setting up kubeconfig...
    Kubectl is now configured to use the cluster.
    
    $ minikube status
    
    minikube: Running
    localkube: Running
    kubectl: Correctly Configured: pointing to minikube-vm at 192.168.99.100

Deploying an echoserver
    
    $ kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
    $ kubectl expose deployment hello-minikube --type=NodePort
    $ kubectl get pod
    $ curl $(minikube service hello-minikube --url)
    $ minikube dashboard
    $ kubectl cluster-info
    $ kubectl cluster-info dump


Some info from kubectl

    $ kubectl get all
      NAME                                READY     STATUS    RESTARTS   AGE
      po/hello-minikube-938614450-zvvhn   1/1       Running   1          5d
      
      NAME                 CLUSTER-IP   EXTERNAL-IP   PORT(S)          AGE
      svc/hello-minikube   10.0.0.119   <nodes>       8080:32306/TCP   5d
      svc/kubernetes       10.0.0.1     <none>        443/TCP          5d
      
      NAME                    DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
      deploy/hello-minikube   1         1         1            1           5d
      
      NAME                          DESIRED   CURRENT   READY     AGE
      rs/hello-minikube-938614450   1         1         1         5d

Interacting with minikube api:

    $ minikube service hello-minikube --url
    http://192.168.99.100:32306

    $ curl $(minikube service hello-minikube --url)
    CLIENT VALUES:
    client_address=172.17.0.1
    command=GET
    real path=/
    query=nil
    request_version=1.1
    request_uri=http://192.168.99.100:8080/
    
    SERVER VALUES:
    server_version=nginx: 1.10.0 - lua: 10001
    
    HEADERS RECEIVED:
    accept=*/*
    host=192.168.99.100:32306
    user-agent=curl/7.54.0
    BODY:
    -no body in request- 

---

Another link about Kubernetes and CoreOS:
https://github.com/coreos/coreos-kubernetes

Has deployment instructions for Vagrant stack too.


---

The link to RKT, an application container engine, coupled with Kubernetes
https://coreos.com/rkt/

Add this to Go doc:
https://coreos.com/rkt/docs/latest/getting-started-guide.html

acbuild


From Kubernetes interactive tutorial:
https://kubernetes.io/docs/tutorials/kubernetes-basics/cluster-interactive/


quick server, a NodeJS application(run as ‘node server.js’, or, better yet, ‘/bin/sh –c node server.js’):

```
# cat server.js
var http = require('http');
var requests=0;
var podname= process.env.HOSTNAME;
var startTime;
var host;
var handleRequest = function(request, response) {
  response.setHeader('Content-Type', 'text/plain');
  response.writeHead(200);
  response.write("Hello Kubernetes bootcamp! | Running on: ");
  response.write(host);
  response.end(" | v=1\n");
  console.log("Running On:" ,host, "| Total Requests:", ++requests,"| App Uptime:", (new Date() - startTime)/1000 , "seconds", "| Log Time:",new Date());
}

var www = http.createServer(handleRequest);
www.listen(8080,function () {
    startTime = new Date();;
    host = process.env.HOSTNAME;
    console.log ("Kubernetes Bootcamp App Started At:",startTime, "| Running On: " ,host, "\n" );
});
```

-------------
Quick server in go:

    package main
    import (
        "log"
        "net/http"
    )

    func main() {
        http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
                log.Printf("request from %v\n", r.RemoteAddr)
               w.Write([]byte("hello\n"))
        })
        log.Fatal(http.ListenAndServe(":5000", nil))
    }

 
Build a statically linked Go binary (no external dependencies)

    $ CGO_ENABLED=0 go build -ldflags '-extldflags "-static"'

verify that the produced binary is statically linked:

    $ file hello

    hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped

    $ ldd hello

        not a dynamic executable

---------------------

    $ minikube version

    minikube version: v0.25.0

    $ minikube start
    There is a newer version of minikube available (v0.26.1).  Download it here:
    https://github.com/kubernetes/minikube/releases/tag/v0.26.1
    To disable this notification, run the following:
    minikube config set WantUpdateNotification false
    Starting local Kubernetes v1.9.0 cluster...
    Starting VM...
    Getting VM IP address...
    Moving files into cluster...
    Setting up certs...
    Connecting to cluster...
    Setting up kubeconfig...
    Starting cluster components...
    Kubectl is now configured to use the cluster.
    Loading cached images from config file.

    $ kubectl version
    Client Version: version.Info{Major:"1", Minor:"9", GitVersion:"v1.9.0", GitCommit:"925c127ec6b946659ad0fd596fa959be43f0cc05", GitTreeState:"clean", BuildDate:"2017-12-15T21:07:38Z", GoVersion:"go1.9.2", Compiler:"gc", Platform:"linux/amd64"}
    Server Version: version.Info{Major:"", Minor:"", GitVersion:"v1.9.0", GitCommit:"925c127ec6b946659ad0fd596fa959be43f0cc05", GitTreeState:"clean", BuildDate:"2018-01-26T19:04:38Z", GoVersion:"go1.9.1", Compiler:"gc", Platform:"linux/amd64"}

    $ kubectl cluster-info
    Kubernetes master is running at https://172.17.0.128:8443
    To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
    (‘kubectl cluster-info dump’ produces a long json with all sorts of data and api self-description)

    $ kubectl get nodes
    NAME      STATUS    ROLES     AGE       VERSION
    host01    Ready     <none>    6m        v1.9.0
 
---

Another step-by-step tutorial:
https://dev.to/azure/learn-kubernetes-with-this-5-part-series-29km

---

Practical Kubernetes Stories for Developers.
https://dev.to/pavanbelagatti/practical-kubernetes-stories-for-developers-330d

---