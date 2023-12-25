[Home](Readme.md)
# RegEx (a cookbook for Regular Expressions)

See Also:
- [Sed](Sed.md)
- [Awk](Awk.md)

---

**Contents**

- [Miscellaneous](RegEx.md#miscellaneous)

---

## Miscellaneous

---

C++ RegEx, ECMAScript
http://www.cplusplus.com/reference/regex/ECMAScript/

---

Neat RegEx vysivyg editor for PCRE, Python, Golang:
https://regex101.com/

--

End of line symbol is "$". To find the executable aws, for example:

    $ find / 2>/dev/null | grep --regex ".*aws$"

---

Nice website for regexes, good examples:

http://www.regular-expressions.info/perl.html

---

All .jpg and .png files, case insensitive

    $ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
    ./somefilder/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000

See also [Find](Find.md)

---

Perl script template to apply a regex to a file
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

---

Replacing thing in Perl is:

    $string =~ s/regex/replacement/g;
    
Or, with positions:

    while ($string =~ m/regex/g) {
      print "Found '$&'.  Next attempt at character " . pos($string)+1 . "\n";
    }
    
---
