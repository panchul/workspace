
## UNDER CONSTRUCTION

# Kubenetes

https://kubernetes.io/

Installing kubectl
https://kubernetes.io/docs/tasks/tools/install-kubectl/

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

