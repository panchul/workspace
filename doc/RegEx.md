

## Cookbook for Regular Expressions


All .jpg and .png files, case insensitive

    $ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
    ./somefilder/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000



