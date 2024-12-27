[Home](Readme.md)
# Swarm mode for Docker

See Also:

- [CUDA](CUDA.md)
- [Docker](Docker.md)
- [Kubeflow](Kubeflow.md)
- [Kubernetes](Kuernetes.md)

https://docs.docker.com/engine/swarm/

---

**Contents**

- [Miscellaneous](DockerSwarm.md#miscellaneous)

---

## Miscellaneous

---

Admin Guide:
https://docs.docker.com/engine/swarm/admin_guide/

---

Install CS Docker Engine
https://docs.docker.com/cs-engine/1.13/

---

Swarm Dashboard
https://github.com/charypar/swarm-dashboard

---

Convenient summary of the failing services using client bundle:

    $ for SVC in $(docker service ls | grep ' 0/' | awk '{print $2}'); do docker service ps $SVC | head -n2 | tail -n1; done

---    

Cleaning up space on nodes:

    $ docker system prune -a
    WARNING! This will remove:
            - all stopped containers
            - all networks not used by at least one container
            - all images without at least one container associated to them
            - all build cache
    Are you sure you want to continue? [y/N] y

---

When things go wrong on a cluster.
Backuping and restoring UCP 
https://docs.docker.com/datacenter/ucp/2.1/guides/admin/backups-and-disaster-recovery/#restore-your-cluster

---
