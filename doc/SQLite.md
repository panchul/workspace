# SQLite

    https://sqlite.org/cli.html

See also:

  - [Cassandra](Cassandra.md)
  - [Couchbase](Couchbase.md)
  - [CouchDB](CouchDB.md)
  - [Databases](Databases.md)
  - DynamoDB
  - [Hadoop](Hadoop.md)
  - MariaDB (a fork of MySQL)
  - [MongoDB](MongoDB.md)
  - [MS SQL Server](MSSQLServer.md)
  - [MySQL](MySQL.md)
  - [PostgreSQL](PostgreSQL.md)
  - [Redis](Redis.md)
  - [Riak](Riak.md)
  - SimpleDB
  - A blog with comparison: http://highscalability.com/blog/2015/12/30/how-to-choose-an-in-memory-nosql-solution-performance-measur.html
  - [Haystack](Haystack.md)

---

To install on Ubuntu:

    $ sudo apt install sqlite3    

---

The basic cli is to just reference the file, or you can use
command `.open` to open it:

    $ sqlite3 db.sqlite3
    SQLite version 3.37.2 2022-01-06 13:25:41
    Enter ".help" for usage hints.
    sqlite> .tables
    courses_file                    users_account                 
    courses_image                   users_account_groups          
    
---
