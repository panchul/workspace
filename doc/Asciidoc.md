[Home](Readme.md)
# ASCIIDoc

http://asciidoc.org/

See Also:

- [Graphics](Graphics.md)

---

**Contents**

- [Miscellaneous](Asciidoc.md#miscellaneous)

---

## Miscellaneous

---

Simple options I used for old templates:

    $ asciidoc --no-header-footer -a data-uri -a icons -a toc -a max-width=55em --out-file - template1.txt

For more, see the `sb_asciidoc` repo.

---

```

AsciiDoc Markup Syntax Summary
==============================

A summary of the most commonly used markup.
For a complete reference see the 'AsciiDoc User Guide'.

Text formatting
---------------
  *bold text*                 (boldface font)
  _emphasized text_           (normally italics)
  'emphasized text'
  +monospaced text+           (proportional font)
  `monospaced text`           (inline literal passthrough)

Document links
--------------
  [[id]]                      (define link target)
  <<id,caption>>              (link to target id)
  link:filename#id[caption]   (link to external HTML file)

URLs
----
  Use normal URL and email addess syntax or:

  http:address[caption]       (link to web page)
  mailto:address[caption]     (link to mail recipient)

Images
------
  image:filename[caption]     (inline image)
  image::filename[caption]    (block image)

Document header
---------------

  The Document Title
  ==================
  author <email>
  revision, date

author, email, revision and date are optional.

Section title underlines
------------------------
  Underlined:

  Level 0                     (document title)
  =======
  Level 1
  -------
  Level 2
  ~~~~~~~
  Level 3
  ^^^^^^^
  Level 4                     (bottom level)
  +++++++

  Single line:

  = Level 0 =                 (document title)
  == Level 1 ==
  === Level 2 ===
  ==== Level 3 ====
  ===== Level 4 =====         (bottom level)

Paragraphs
----------
A normal paragraph.           (styles: literal,verse,quote,listing,
                                       NOTE,TIP,WARNING,IMPORTANT,CAUTION)
  An indented literal
  paragraph.

Delimited blocks
----------------
Delimiters must begin at left margin.

  -------------------         (styles: source,music,graphviz)
  listing block
  -------------------

  ...................         (styles: listing,verse)
  literal block
  ...................

  *******************
  sidebar block
  *******************

  [style, author, cite]
  ___________________         (styles: quote,verse)
  quote block
  ___________________

  ===================         (styles: NOTE,TIP,WARNING,
  example block                        IMPORTANT,CAUTION)
  ===================

  ///////////////////
  comment block
  ///////////////////

  +++++++++++++++++++         (styles: pass,asciimath,latexmath)
  passthrough block
  +++++++++++++++++++

  [style]                     (styles: abstract,partintro)
  --
  open block
  --

More block elements
-------------------
  [attributes list]
  .Block title
  // Comment line
  include::filename[]

Tables
------
  .An example table
  [width="40%",cols="^,2m",frame="topbot",options="header,footer"]
  |======================
  |Column 1 |Column 2
  |1        |Item 1
  |2        |Item 2
  |3        |Item 3
  |6        |Three items
  |======================

  Common attributes:

  grid:    none,cols,rows,all
  frame:   topbot,none,sides,all
  options: header,footer
  format:  psv,csv,dsv
  valign:  top,bottom,middle
  width:   1%..100%
  cols:    colspec[,colspec,...]

  colspec:    [multiplier*][align][width][style]
  multiplier: 1...
  width:      1... or 1%...100%
  align:      [horiz][.vert]
               horiz: < (left), ^ (center), > (right)
               vert:  < (top),  ^ (middle), > (bottom)
  style:      d[efault], e[mphasis], m[onospaced], a[sciidoc],
              s[trong], l[iteral], v[erse], h[eader]
  cell:       [cellspec]|data
  cellspec:   [span*|+][align][style]
  span:       [colspan][.rowspan]
               colspan: 1...
               rowspan: 1...

Bulleted lists
--------------
  - item text
  * item text
  ** item text
  *** item text
  **** item text
  ***** item text

  (styles: callout,bibliography)

Numbered lists
--------------
  1. arabic (decimal) numbering
  a. loweralpha numbering
  F. upperalpha numbering
  iii) lowerroman numbering
  IX) upperroman numbering

  . arabic (decimal) numbering
  .. loweralpha numbering
  ... lowerroman numbering
  .... upperalpha numbering
  ..... upperroman numbering

  (styles: arabic,loweralpha,upperalpha,lowerroman,upperroman)

Labeled lists
-------------
  label:: item text
  label;; item text
  label::: item text
  label:::: item text

  (styles: horizontal,vertical,glossary,qanda,bibliograpy)

More inline elements
--------------------
  footnote:[footnote text]    (document footnote)

```

---

About resizing images:
https://github.com/asciidoctor/asciidoctor.org/blob/master/docs/_includes/image-sizing.adoc

    image::filename.jpg[alt,640,480]
    
that is, in long form:

    image::filename.jpg[alt=Flower,width=640,height=480]    

---


