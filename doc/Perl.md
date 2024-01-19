[Home](Readme.md)
# Perl

My Perl sandbox is [https://github.com/panchul/sb_perl](https://github.com/panchul/sb_perl).

Sea Also:

  - [RegEx.md](RegEx.md)

---

**Contents**

- [Miscellaneous](Perl.md#miscellaneous)

---

## Miscellaneous

---

To add modules, use `cpan`
http://www.cpan.org/modules/INSTALL.html

---

Nice cheat sheet website:
http://lzone.de/cheat-sheet/Perl

---

Compound statements

        if (EXPR) BLOCK
        if (EXPR) BLOCK else BLOCK
        if (EXPR) BLOCK elsif (EXPR) BLOCK ...
        if (EXPR) BLOCK elsif (EXPR) BLOCK ... else BLOCK
        unless (EXPR) BLOCK
        unless (EXPR) BLOCK else BLOCK
        unless (EXPR) BLOCK elsif (EXPR) BLOCK ...
        unless (EXPR) BLOCK elsif (EXPR) BLOCK ... else BLOCK
        given (EXPR) BLOCK
        LABEL while (EXPR) BLOCK
        LABEL while (EXPR) BLOCK continue BLOCK
        LABEL until (EXPR) BLOCK
        LABEL until (EXPR) BLOCK continue BLOCK
        LABEL for (EXPR; EXPR; EXPR) BLOCK
        LABEL for VAR (LIST) BLOCK
        LABEL for VAR (LIST) BLOCK continue BLOCK
        LABEL foreach (EXPR; EXPR; EXPR) BLOCK
        LABEL foreach VAR (LIST) BLOCK
        LABEL foreach VAR (LIST) BLOCK continue BLOCK
        LABEL BLOCK
        LABEL BLOCK continue BLOCK
        PHASE BLOCK
        
---

Great summary on regexes

http://www.regular-expressions.info/perl.html

---

Here's how the subroutines work:

    my $first_name = prompt("First name: ");
    my $last_name = prompt("Last name: ");
     
    sub prompt {
       my ($text) = @_;
       print $text;
     
       my $answer = <STDIN>;
       chomp $answer;
       return $answer;
    }
    
---

File operations summary        
https://perldoc.perl.org/functions/open.html

Using `sysopen`:

    use IO::Handle;
    sysopen(my $fh, $path, O_RDWR|O_CREAT|O_EXCL)
            or die "Can't open $path: $!";
    $fh->autoflush(1);
    print $fh "stuff $$\n";
    seek($fh, 0, 0);
    print "File contains: ", readline($fh);   
           
---
