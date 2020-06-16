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

I created a How-To for hybrid cloud, extracting some useful steps that could be useful without Kubernetes.
This is also useful:
 
- https://stackoverflow.com/questions/48747538/using-windows-smb-shares-from-kubernetes-deployment-app
- https://github.com/kubernetes/examples/tree/master/staging/volumes

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

    apiVersion: v1
    kind: PersistentVolume
    metadata:
      name: samba-share-volume
      labels:
        type: local
    spec:
      storageClassName: manual
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
      storageClassName: manual
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
              name: samba-share-volume
          volumes:
          - name: samba-share-volume
            persistentVolumeClaim:
              claimName: samba-share-claim

You can now see the pv being `Bound`:
    
    $ kubectl -n kubeflow get pv
    NAME                 CAPACITY   ACCESS MODES  RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS    REASON   AGE
    ...
    samba-share-volume   10Gi       RWX           Retain           Bound    default/local-storage  local-storage            3m54s
    ...

---