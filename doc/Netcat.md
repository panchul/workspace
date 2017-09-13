
## UNDER CONSTRUCTION

# netcat (nc)

See Also:
 [Linux](Linux.md)
 
 
---

Using nc for Zookeeper debugging:

    $ perl -e "print 'stmk', pack('q>', 0b0011111010)" | nc localhost 2181
    250

--- 