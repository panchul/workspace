
## UNDER CONSTRUCTION

# Swarm mode for Docker

https://docs.docker.com/engine/swarm/

Admin Guide:
https://docs.docker.com/engine/swarm/admin_guide/


---

Swarm Dashboard
https://github.com/charypar/swarm-dashboard

---

Convenient summary of the failing services using client bundle:

    $ for SVC in $(docker service ls | grep ' 0/' | awk '{print $2}'); do docker service ps $SVC | head -n2 | tail -n1; done

---    