

## UNDER CONSTRUCTION

Easily Encrypt your Flash Drives with Linux
[https://www.linux.com/learn/easily-encrypt-your-flash-drives-linux](https://www.linux.com/learn/easily-encrypt-your-flash-drives-linux)


## Installation

### Installing using USB

[https://en.wikipedia.org/wiki/Live_USB](https://en.wikipedia.org/wiki/Live_USB)

LiLi:
[http://www.linuxliveusb.com/en/download](http://www.linuxliveusb.com/en/download)


## Utilities

Some nice projects are worth mentioning. I might had to stash them fo later,
when I have time to explore them more and maybe create a sub-page.

### Monit

https://mmonit.com/monit/


### Graphics
 
Command-line untilities for image processing:
https://www.linux.com/learn/cool-linux-command-line-image-management-hacks

#### ```feh```

```sudo apt-get install feh``` - installs it (Ubuntu)

To list the files with the dimentions:
    
    $ feh -l
    NUM	FORMAT	WIDTH	HEIGHT	PIXELS	SIZE	ALPHA	FILENAME
    1	jpeg	2187	1458	  3M	  2M	-	./IMG_8408.JPG    

#### ```identify``` from imagemagick

```sudo apt-get install imagemagick``` - installs it (Ubuntu)

To get information about a file:

    $ identify ./IMG_8455.JPG 
    ./IMG_8455.JPG JPEG 2592x1728 2592x1728+0+0 8-bit DirectClass 4.338MB 0.000u 0:00.000

```identify -verbose ./IMG_8455.JPG``` gives much more info. 

Pretty neat for the summary of what is out there:

    $ find . -iregex ".*\.\(jpg\|png\)" -exec identify {} \;
    ./somefolder/anotherone/IMG_8408.JPG JPEG 2187x1458 2187x1458+0+0 8-bit DirectClass 2.61MB 0.000u 0:00.000

#### xcowsay

```sudo apt-get install xcowsay``` - installs it (Ubuntu)

To get a temporary pop-up with a cute picture saying your line:

    $ xcowsay Hello there, I am using xcowsay. Ok, Moo-o-o-o

## Ubuntu

http://www.howtogeek.com/howto/ubuntu/install-an-rpm-package-on-ubuntu-linux/

## Misc. Troubleshooting

---

#### grub issues, broken packager 

On Ubuntu vm setup in VirtualBox on MacOS via Vagrant.
Had something wrong with ```grub``` on a vm, needed to run ```sudo dpkg --configure -a``` to get
the packager work better.

---

#### html5, flash, etc.

Here is how you could get html5 working on ubuntu:

    sudo apt-get install ubuntu-restricted-extras
    
(http://askubuntu.com/questions/475351/firefox-html5-video-support )

---

#### To update the OS, run these:

    sudo apt-get -y update
    sudo apt-get -y upgrade

---

#### Install languages from command line

    sudo apt-get install language-pack-[cod] language-pack-gnome-[cod] language-pack-[cod]-base language-pack-gnome-[cod]-base 

For Gnome there is also:

    gnome-language-selector --install [cod]
    
---
    
#### OpenVPN

Build a Real VPN with OpenVPN:

https://www.linux.com/learn/intro-to-linux/2017/3/build-real-vpn-openvpn


---

#### Linux Kernel

https://kernelnewbies.org/FAQ  - nice FAQ


---

You can use this to get the name of the release:

    $ lsb_release -cs
    trusty



