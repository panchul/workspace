
## UNDER CONSTRUCTION

# Find

Standard Unix command.

See also [Linux](Linux.md)

---

Sample usage of ```find``` with ```xargs```:
    
    $ find . -name "*.txt" | xargs dos2unix

The quotation marks are important - may not work without them.

See also [Linux](Linux.md)

---

All .jpg and .png files, case insensitive

    $ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
    ./somefilder/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000

See also [RegEx](RegEx.md)

---
