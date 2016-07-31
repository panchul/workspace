
## Under Construction



### Simple word manipulation demo.
 
Create file ```pairs.txt```, put these in it:

    $ cat pairs.txt
    aaa bbb
    aaaa bbbb

Run simple awk comand on it:

    $ awk '{print $2, $1}' pairs.txt 
    bbb aaa
    bbbb aaaa
