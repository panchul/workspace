#!/usr/bin/perl

#
# Remove the trailing \r that windows applications add.
#

undef $/;

$_ = <>;

# s/(.)\x0d\x0a$/($1)\x0a/ge;
s/\r//ge;

print;

