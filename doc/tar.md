
# tar

See Also:
 - [Linux](Linux.md)

---

The path thing. How option "-C" works
Create files in a subdir of a subdir

    $ mkdir -p tmp/tmp2
    $ echo "file content" > tmp/tmp2/myfile.txt

Option "-C" moves to that directory right before the compression starts:    
    
    $ tar c -C tmp -zf tmp/myarch.tgz tmp2/myfile.txt

Archive is created in that directory, before the move.

    $ cp tmp/myarch.tgz ./
    $ ls
    myarch.tgz	tmp

When we extract the achive, the 'tmp' subdir is not there anymore:
    
    $ tar xzf myarch.tgz
    $ ls
    myarch.tgz	tmp		tmp2
    $ ls tmp2
    myfile.txt

---