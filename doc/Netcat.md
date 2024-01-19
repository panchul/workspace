[Home](Readme.md)
# netcat (nc)

See Also:
 [Linux](Linux.md)
 
---

Using nc for Zookeeper debugging:

    $ perl -e "print 'stmk', pack('q>', 0b0011111010)" | nc localhost 2181
    250

To do the same through a jump server 

    $ perl -e "print 'stmk', pack('q>', 0b0011111010)" | ssh -i mykey.pem myuser@myhostname nc some_other_host.something 2181

--- 
