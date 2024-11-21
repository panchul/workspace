[Home](Readme.md)
# MS SQL Server

See Also:

  - [PostgreSQL](PostgreSQL.md)
  - [MySQL](MySQL.md)


---

**Contents**

- [Installing](MSSQLServer.md#installing)
- [Miscellaneous](MSSQLServer.md#miscellaneous)

---

## Installing

---

MSSQL on Ubuntu. Quickstart: Install SQL Server and create a database on Ubuntu:

https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver15

About connection string:

- https://stackoverflow.com/questions/63434373/connection-string-for-connecting-to-sql-server-on-ubuntu
- https://www.connectionstrings.com/microsoft-sql-server-odbc-driver/ - might be a good one

---

Starting, stopping, restarting
https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/start-stop-pause-resume-restart-sql-server-services?view=sql-server-ver15

---

Installing Developer version:
https://www.guru99.com/download-install-sql-server.html

---

## Miscellaneous

---

Link to restoring sql database:

https://docs.microsoft.com/en-us/sql/samples/wide-world-importers-oltp-install-configure?view=sql-server-ver15

https://github.com/Microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0

To restore a backup to a SQL Server instance, you can use Management Studio.

 1. Open SQL Server Management Studio and connect to the target SQL Server instance.
 2. Right-click on the Databases node, and select Restore Database.
 3. Select Device and click on the button ...
 4. In the dialog Select backup devices, click Add, navigate to the database backup in the filesystem of the server, and select the backup. Click OK.
 5. If needed, change the target location for the data and log files, in the Files pane. Note that it is best practice to place data and log files on different drives.
 6. Click OK. This will initiate the database restore. After it completes, you will have the database WideWorldImporters installed on your SQL Server instance.
 
---