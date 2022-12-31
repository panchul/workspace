# Redis

https://redis.io/

https://github.com/antirez/redis

See Also:

- [Zookeeper](Zookeeper.md)
- memcache

---

Redis studio, UI for Redis

https://github.com/cinience/RedisStudio/releases

---

A Redis library:

https://stackexchange.github.io/StackExchange.Redis/

Pub/Sub message order https://stackexchange.github.io/StackExchange.Redis/PubSubOrder

---

Just play with it, do set/get 

    % cd src
    % ./redis-cli
    redis> ping
    PONG
    redis> set foo bar
    OK
    redis> get foo
    "bar"
    redis> incr mycounter
    (integer) 1
    redis> incr mycounter
    (integer) 2
    redis>

---
