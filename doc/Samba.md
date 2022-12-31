# Samba server(network storage)

See Also:

  - [CUDA](CUDA.md)
  - [Docker](Docker.md)
  - [DockerCompose](DockerCompose.md)
  - [DockerSwarm](DockerSwarm.md)
  - [Kubeflow](Kubeflow.md)
  - [Kubernetes](Kubernetes.md)
  - [LXD, Linux Containers](LXD.md)

---

I created a How-To for hybrid cloud, extracting some useful steps that could be
useful without Kubernetes. This is also useful:
 
- https://stackoverflow.com/questions/48747538/using-windows-smb-shares-from-kubernetes-deployment-app
- https://github.com/kubernetes/examples/tree/master/staging/volumes

At the vm that will be a Samba server:

    $ sudo apt update
    $ sudo apt -y install samba
    $ sudo mkdir /home/share
    $ sudo chmod 777 /home/share
    $ sudo vi /etc/samba/smb.conf

Add to the file the entries you would like to use, for example:

    ...
    [sambashare]
        comment = Samba on Ubuntu
        path = /home/azureuser/sambashare
        read only = no
        browsable = yes

    [sambauser1]
        path = /home/share/sambauser1
        read only = no
        browseable = no
        force create mode = 0660
        force directory mode = 2770
        valid users = @sambauser1 @sambashare

    [smbadmin]
        path = /home/share/smbadmin
        read only = no
        browseable = yes
        force create mode = 0660
        force directory mode = 2770
        valid users = @sambashare @smbadmin

Create the users and update the folder ownership:

    $ sudo chgrp sambashare /home/share
    $ sudo useradd -M -d /home/share/sambauser1 -s /usr/sbin/nologin -G sambashare sambauser1
    $ sudo mkdir /home/share/sambauser1
    $ sudo chown sambauser1:sambashare /home/share/sambauser1
    $ sudo chmod 2770 /home/share/sambauser1

And created Samba users:

    $ sudo smbpasswd -a sambauser1
    New SMB password:
    Retype new SMB password:
    Added user sambauser1.

And enable this user:

    $ sudo smbpasswd -e sambauser1
    Enabled user sambauser1.

Create an admin user:

    $ sudo useradd -M -d /home/share/smbadmin -s /usr/sbin/nologin -G sambashare smbadmin
    $ sudo mkdir /home/share/smbadmin
    $ sudo smbpasswd -a smbadmin
    New SMB password:
    Retype new SMB password:
    Added user smbadmin.
    $ sudo smbpasswd -e smbadmin
    Enabled user smbadmin.
    $ sudo chown smbadmin:sambashare /home/share/smbadmin
    $ sudo chmod 2770 /home/share/smbadmin

    $ sudo systemctl restart smbd nmbd

To check the status:

    $ systemctl status smbd
    ● smbd.service - Samba SMB Daemon
       Loaded: loaded (/lib/systemd/system/smbd.service; enabled; vendor preset: enabled)
       Active: active (running) since Fri 2020-05-08 01:11:37 UTC; 19s ago
         Docs: man:smbd(8)
               man:samba(7)
               man:smb.conf(5)
     Main PID: 19151 (smbd)
       Status: "smbd: ready to serve connections..."
        Tasks: 4 (limit: 8303)
       CGroup: /system.slice/smbd.service
               ├─19151 /usr/sbin/smbd --foreground --no-process-group
               ├─19165 /usr/sbin/smbd --foreground --no-process-group
               ├─19166 /usr/sbin/smbd --foreground --no-process-group
               └─19168 /usr/sbin/smbd --foreground --no-process-group

    May 08 01:11:37 sambadata systemd[1]: Starting Samba SMB Daemon...
    May 08 01:11:37 sambadata systemd[1]: Started Samba SMB Daemon.

Update your firewall rules to let the smb traffic through:

    $ sudo ufw allow 'Samba'
    Rules updated
    Rules updated (v6)
                              
And verify that the ports are listening:

    $ sudo netstat -tulpn | egrep "samba|smbd|nmbd|winbind"
    tcp        0      0 0.0.0.0:139             0.0.0.0:*               LISTEN      19151/smbd
    tcp        0      0 0.0.0.0:445             0.0.0.0:*               LISTEN      19151/smbd
    tcp6       0      0 :::139                  :::*                    LISTEN      19151/smbd
    tcp6       0      0 :::445                  :::*                    LISTEN      19151/smbd
    udp        0      0 172.16.0.255:137        0.0.0.0:*                           19126/nmbd
    udp        0      0 172.16.0.4:137          0.0.0.0:*                           19126/nmbd
    udp        0      0 0.0.0.0:137             0.0.0.0:*                           19126/nmbd
    udp        0      0 172.16.0.255:138        0.0.0.0:*                           19126/nmbd
    udp        0      0 172.16.0.4:138          0.0.0.0:*                           19126/nmbd
    udp        0      0 0.0.0.0:138             0.0.0.0:*                           19126/nmbd

You are ready to get the samba clients connect to your server.

On the client side, if you have to do it yourself, install a Samba client:

    $ sudo apt install -y smbclient cifs-utils

Create a folder for mounting:

    $ sudo mkdir /mnt/shares
    $ sudo chown azureuser:azureuser /mnt/shares

Put your share drive information to `/etc/samba`:

    $ sudo vi /etc/samba/.sambacreds
    $ cat /etc/samba/.sambacreds
    username=sambauser1
    password=<the password>
    domain=WORKGROUP

Define the mount in your `fstab` file, pointing to your .sbmabcreds file and the mounting point we created:

    $ sudo vi /etc/fstab
    $ cat /etc/fstab
    ...
    //12.34.259.89/sambauser1        /mnt/shares     cifs    rw,uid=azureuser,guest,noperm,credentials=/etc/samba/.sambacreds        0 0
    ...

    $ sudo mount /mnt/shares

Verify the mounting, you should see your server's ip and Samba user:

    $ sudo mount
    ...
    //12.34.259.89/sambauser1 on /mnt/shares type cifs (rw,relatime,vers=default,cache=strict,username=sambauser1,domain=WORKGROUP,uid=1000,forceuid,gid=0,noforcegid,addr=12.34.259.89,file_mode=0755,dir_mode=0755,soft,nounix,serverino,mapposix,noperm,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1)
    ...

Try the following from two different nodes of your cluster. On one:

    $ echo "from machine a" >  /mnt/shares/from_machine_a.txt
    
On the other:    

    $ ls /mnt/shares/
    from_machine_a.txt
    $ cat /mnt/shares/from_machine_a.txt
    from machine a

You would need to repeat the same installation process on all Kubernetes nodes, because
the pods could be instantiated anywhere and will try to access the local storage there.

Create a .yaml with pv and pvc definitions pointing to the created shared folder:

The storage class:

    kind: StorageClass
    apiVersion: storage.k8s.io/v1
    metadata:
      name: local-storage
    provisioner: kubernetes.io/no-provisioner
    reclaimPolicy: Retain
    volumeBindingMode: WaitForFirstConsumer

The persistent volume:

    apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: samba-share-volume
      labels:
        type: local
    spec:
      storageClassName: local-storage
      capacity:
        storage: 2Gi
      accessModes:
        - ReadWriteMany
      hostPath:
        path: "/mnt/shares/kfbuffer"
    
and a claim,
    
    kind: PersistentVolumeClaim
    apiVersion: v1
    metadata:
      name: samba-share-claim
    spec:
      storageClassName: local-storage
      accessModes:
        - ReadWriteMany
      resources:
        requests:
          storage: 1Gi
    
and assigned the claim to the application.
    
    apiVersion: extensions/v1beta1
    kind: Deployment
    metadata:
      name: samba-share-deployment
    spec:
      replicas: 2
      template:
        metadata:
          labels:
            app: samba-share-deployment
            tier: backend
        spec:
          containers:
          - name: samba-share-deployment
            image: nginx
            ports:
            - containerPort: 80
            volumeMounts:
            - mountPath: "/usr/share/nginx/html"
              name: samba-share-volume2
          volumes:
          - name: samba-share-volume2
            persistentVolumeClaim:
              claimName: samba-share-claim

You can now see the pv being `Bound`:
    
    $ kubectl get pv -A
    NAME                 CAPACITY   ACCESS MODES  RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS    REASON   AGE
    ...
    samba-share-volume   10Gi       RWX           Retain           Bound    default/local-storage  local-storage            3m54s
    ...

---

Another example, from here: https://github.com/DanWahlin/DockerAndKubernetesCourseCode

    apiVersion: v1
    kind: ConfigMap
    metadata:
      labels:
        app: mongo-secrets-env
      name: mongo-secrets-env
    data:
      MONGODB_DBNAME: codeWithDan
      MONGO_INITDB_ROOT_USERNAME: admin
    
    ---
    
    kind: StorageClass
    apiVersion: storage.k8s.io/v1
    metadata:
      name: local-storage
    provisioner: kubernetes.io/no-provisioner
    # The reclaim policy applies to the persistent volumes not the storage class itself. 
    # pvs and pvcs that are created using that storage class will inherit the reclaim policy set here.
    reclaimPolicy: Retain
    volumeBindingMode: WaitForFirstConsumer
    
    ---
    
    # Note: While a local storage PV works, going with a more durable solution (NFS, cloud option, etc.) is recommended
    # Adding this for demo purposes to run on Docker Desktop Kubernetes since it only supports a single Node
    # https://kubernetes.io/blog/2018/04/13/local-persistent-volumes-beta/
    apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: mongo-pv
    spec:
      capacity:
        storage: 1Gi
      # volumeMode block feature gate enabled by default with 1.13+
      volumeMode: Filesystem
      accessModes:
      - ReadWriteOnce
      # StorageClass has a reclaim policy default so it'll be "inherited" by the PV
      # persistentVolumeReclaimPolicy: Retain
      storageClassName: local-storage
      local:
        path: /tmp/data/db
      nodeAffinity:
        required:
          nodeSelectorTerms:
          - matchExpressions:
            - key: kubernetes.io/hostname
              operator: In
              values:
              - docker-desktop
    
    ---
    
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: mongo-pvc
    spec:
      accessModes:
      - ReadWriteOnce
      storageClassName: local-storage
      resources:
        requests:
          storage: 1Gi
    
    ---
    
    apiVersion: apps/v1
    kind: StatefulSet
    metadata:
      labels:
        app: mongo
      name: mongo
    spec:
      serviceName: mongo
      replicas: 1
      selector:
        matchLabels:
          app: mongo
      template:
        metadata:
          labels:
            app: mongo
        spec:
          volumes:
          - name: mongo-volume
            persistentVolumeClaim:
              claimName: mongo-pvc
            # Example only - environment vars actually used here
          - name: secrets
            secret:
              secretName: db-passwords
          containers:
          - env:
            - name: MONGODB_DBNAME
              valueFrom:
                configMapKeyRef:
                  key: MONGODB_DBNAME
                  name: mongo-secrets-env
            - name: MONGO_INITDB_ROOT_USERNAME
              valueFrom:
                configMapKeyRef:
                  name: mongo-secrets-env
                  key: MONGO_INITDB_ROOT_USERNAME
            # Pull password from secrets
            - name: MONGO_INITDB_ROOT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: db-passwords
                  key: db-password
            image: mongo
            name: mongo
            ports:
            - containerPort: 27017
            resources: {}        
            volumeMounts:
            - name: mongo-volume
              mountPath: /data/db
            # Example only - environment vars actually used here
            - name: secrets
              mountPath: /etc/db-passwords
              readOnly: true
    
---