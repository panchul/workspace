# Markdown

--
## Miscellaneous

Three or more dashes turn into the horizontal dividing lines ( `<hr>`)

    ---

---

## Font formatting

    **bold text**
    `code snippet`
    *italic text*
    ~~Scratch text~~

**bold text**
`code snippet`
*italic text*
~~Scratch text~~

---

## Lists

    1. List item one
        * sublist, not numbered
        * sublist, not numbered two
    1. List item two
        1. sublist, not numbered
        1. sublist, not numbered two
    1. List item three


1. List item one
    * sublist, not numbered
    * sublist, not numbered two
1. List item two
    1. sublist, not numbered
    1. sublist, not numbered two
1. List item three

---

## Links

    [link text](https://www.somestuff.com/more_stuff "here goes the page")

[link text](https://www.example.com/more_stuff "here goes the page")

## Internal Links
    
    ### links with spaces
    [link text](#links-with-spaces)

### links with spaces
[link text](#links-with-spaces)

Github Flavored Markdown for a while and can summarize with four rules:

   - punctuation marks will be dropped
   - leading white spaces will be dropped
   - upper case will be converted to lower
   - spaces between letters will be converted to -

For example, if your section is named this:

   `## 1.1 Hello World`

Create a link to it this way:

   `[Link](#11-hello-world)`

---

## Video links

It is basically links to videos, it is nice to fetch the image youtube provides:

    [![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)

---

## Images

     Inline-style: 
    ![alt text](URI_TO_IMAGE "Image title text")
    
    Reference-style: 
    ![alt text][some_icon]
    
    [some_icon]: URI_TO_IMAGE "Image title text"
 
Inline-style: 
![alt text](URI_TO_IMAGE "Image title text")

Reference-style: 
![alt text][some_icon]

[some_icon]: URI_TO_IMAGE "Image title text"

To scale, you can replace it with html-like format:

    ![mypic.png](mypic.png)

to

    <img src="mypic.png" width="40%" height="40%">

---

## Cheatsheets

No need to re-invent the wheel. Here are some nice ones:

[https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

---
