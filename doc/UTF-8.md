
## Under Construction


[https://en.wikipedia.org/wiki/UTF-8](https://en.wikipedia.org/wiki/UTF-8)


    | --------- | ---------- | ---------- | ---------- | -------- | -------- | -------- | -------- | 
    | Number    | Bits for   | First      | Last       | Byte 1   | Byte 2   | Byte 3   | Byte 4   |
    | of bytes  | code point | code point | code point |          |          |          |          |
    | --------- | ---------- | ---------- | ---------- | -------- | -------- | -------- | -------- | 
    | 1         | 7          | U+0000     | U+007F     | 0xxxxxxx |          |          |          |
    | 2         | 11         | U+0080     | U+07FF     | 110xxxxx | 10xxxxxx |          |          |
    | 3         | 16         | U+0800     | U+FFFF     | 1110xxxx | 10xxxxxx | 10xxxxxx |          |
    | 4         | 21         | U+10000    | U+10FFFF   | 11110xxx | 10xxxxxx | 10xxxxxx | 10xxxxxx |
    | --------- | ---------- | ---------- | ---------- | -------- | -------- | -------- | -------- | 


---

In Markdown you can use things like:

\&#9658;

converts to

&#9658;

---

