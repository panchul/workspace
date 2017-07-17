
## UNDER CONSTRUCTION

# RegEx

## Cookbook for Regular Expressions


All .jpg and .png files, case insensitive

    $ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
    ./somefilder/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000


### Perl script template to apply a regex to a file

The following removes '\r' symbols from a file:

    #!/usr/bin/perl
    #
    # Remove the trailing \r that windows applications add.
    # Run it as:
    #  convert_dos2unix.p. < input_file > output_file
    #
    undef $/;
    $_ = <>;
    # s/(.)\x0d\x0a$/($1)\x0a/ge;
    s/\r//ge;
    print;

