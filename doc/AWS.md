#AWS

See Also:

- [Azure](Azure.md)
- [GoogleCloud](GoogleCloud.md)
- [Sagemaker](Sagemaker.md)


---

AWS to Azure services comparison
https://docs.microsoft.com/en-us/azure/architecture/aws-professional/services

---

AWS playlist, with useful how-tos and tutorials
https://egghead.io/playlists/learn-aws-lambda-from-scratch-d29d

And a bunch of random notes somebody was taking to get aws certificate.
https://dev.to/tlakomy/random-notes-taken-while-preparing-for-aws-certified-developer-associate-exam-2h4p

---

A useful utility to get the info from aws:

https://thehftguy.com/2016/03/10/how-to-export-amazon-ec2-instances-to-a-csv-file/

https://github.com/awslabs/aws-shell

---

AWS CLI
http://docs.aws.amazon.com/cli/latest/userguide/installing.html

---

Alternative AWS Shell, a cli to aws
https://github.com/awslabs/aws-shell

---

CloudWatch costs money if you add metrics and want to store them.

---

Some useful links for AWS Certification:

https://www.amazon.com/Certified-Solutions-Architect-Official-Study/dp/1119138558
https://gist.github.com/leonardofed/bbf6459ad154ad5215d354f3825435dc

---

About EBS volumes, how to format and mount them, etc:

http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

    $  lsblk
    NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
    xvda    202:0    0  100G  0 disk 
    └─xvda1 202:1    0  100G  0 part /
    xvdb    202:16   0 1000G  0 disk 
    
    $  sudo file -s /dev/xvdb
    /dev/xvdb: data
    
    $  sudo mkfs -t ext4 /dev/xvdb
    mke2fs 1.42.9 (28-Dec-2013)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    Stride=0 blocks, Stripe width=0 blocks
    65536000 inodes, 262144000 blocks
    13107200 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=2409627648
    8000 block groups
    32768 blocks per group, 32768 fragments per group
    8192 inodes per group
    Superblock backups stored on blocks: 
    	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
    	4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 
    	102400000, 214990848
    
    Allocating group tables: done                            
    Writing inode tables: done                            
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done     

 
    $  sudo mkdir /data

Can mount temporarily like so:
    
    $  sudo mount /dev/xvdb /data

But to do it right, need to use UUID and write it in fstab:

    $  sudo file -s /dev/xvdb
    /dev/xvdb: Linux rev 1.0 ext4 filesystem data, UUID=something-sdfads-23452346-9etr-notreadluuid6 (extents) (64bit) (large files) (huge files)

Or can do this:

    $  ls -al /dev/disk/by-uuid/

    $  sudo cp /etc/fstab /etc/fstab.orig
    $  sudo vi /etc/fstab

Add this into fstab:

    UUID=1d3dddddgfd-afakaa-4asd-ag35-342sanitized55 /data ext4 defaults,nofail 0 2

This will mount what is in /etc/fstab:
        
    $  sudo mount -a

Same thing with some automation:

    lsblk
    sudo file -s /dev/xvdb
    pause "should be data"
    sudo mkfs -t ext4 /dev/xvdb
    sudo mkdir /mymountpoint
    sudo file -s /dev/xvdb
    sudo cp /etc/fstab /etc/fstab.orig

then I had to use a temp file to because bash's "" will mess up printf's "":
    
    sudo file -s /dev/xvdb | awk '{printf "%s    /mymountpoint ext4 defaults,nofail 0 2\n", $8}' > myvolume
    sudo sh -c "cat myvolume >> /etc/fstab "
    
    sudo mount -a
    ls -la /data

---

Ansible'ized setup for Kafka on AWS EC2 using Galaxy:

https://galaxy.ansible.com/giladju/setup-kafka-cluster-ec2/

---

Resizing of the volumes
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html

https://aws.amazon.com/premiumsupport/knowledge-center/expand-root-ebs-linux/


---

About resizing of instances:

http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html

---

Installing Jenkins on AWS:
https://d1.awsstatic.com/Projects/P5505030/aws-project_Jenkins-build-server.pdf

---

AWS CLI getting started:
http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

You might want to run "aws configure" to use proper AWS access credentials.

For Python work, install boto3, run "pip install boto3" on a system where you want to run it,
Boto3 repo: https://github.com/boto/boto3

---

How to deploy your frontend application on aws s3
https://dev.to/oyetoket/how-to-deploy-your-frontend-application-on-aws-s3-31m9
(discusses S3 and react hooks)

---
