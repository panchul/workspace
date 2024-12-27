[Home](Readme.md)
# ffmpeg utility

See Also:

 - [Graphics](Graphics.md)

[https://www.ffmpeg.org/](https://www.ffmpeg.org/)

**Table of contents**

- [Installing](FfMpeg.md#installing)
- [Extracting frames](FfMpeg.md#extracting-frames)
- [Video input](FfMpeg.md#video-input)
- [Video Encoding](FfMpeg.md#video-encoding)
- [Miscellaneous](FfMpeg.md#Miscellaneous)

---

## Installing

---

Clone from ffmpeg.org:

```bash
    $ git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
```

May need some pre-reqs:

```bash
    $ yum install nasm
```

Or on Mac:

```bash
    $ brew install nasm    
```

In the source folder:
    
```bash
    $ ./configure
    $ make
    $ sudo make install
```

---

## Extracting frames

---

To extract frames from a video, you can use ffmpeg:

```bash
    $ ffmpeg -i somevideo.mp4 myframe%03d.jpg
```
---

## Video input

---

Grabbing video from webcamera (device 0):

```bash
    $ ffmpeg -y -f vfwcap -r 25 -i 0 out.mp4
```

More on this here: [https://trac.ffmpeg.org/wiki/Capture/Webcam](https://trac.ffmpeg.org/wiki/Capture/Webcam)

---

## Video Encoding

---

Pack frames into video.
https://hamelot.io/visualization/using-ffmpeg-to-convert-a-set-of-images-into-a-video/

When using ffmpeg to compress a video, I recommend using the libx264 codec,
from experience it has given me excellent quality for small video sizes.
I have noticed that different versions of ffmpeg will produce different
output file sizes, so your mileage may vary.

To take a list of images that are padded with zeros (pic0001.png, pic0002.png…. etc)
 use the following command:

```bash
    $ ffmpeg -r 60 -f image2 -s 1920x1080 -i pic%04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4
```

where the %04d means that zeros will be padded until the length of the string is 4 i.e 0001…0020…0030…2000 and so on. If no padding is needed use something similar to pic%d.png or %d.png.

    -r is the framerate (fps)
    -crf is the quality, lower means better quality, 15-25 is usually good
    -s is the resolution
    -pix_fmt yuv420p specifies the pixel format, change this as needed
    the file will be output (in this case) to: test.mp4

Specifying start and end frames

```bash
    $ ffmpeg -r 60 -f image2 -s 1920x1080 -start_number 1 -i pic%04d.png -vframes 1000 -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4
```
    -start_number specifies what image to start at
    -vframes 1000 specifies the number frames/images in the video

Overlaying image on video

Assuming that you have an overlay image that is the same size as the video, you can use the following command to add it during the ffmpeg compression process.

```bash
    $ ffmpeg -r 60 -f image2 -s 1920x1080 -i pic%04d.png -i ~/path_to_overlay.png -filter_complex "[0:v][1:v] overlay=0:0" -vcodec libx264 -crf 25  -pix_fmt yuv420p test_overlay.mp4
```

    ~/path_to_overlay.png is the full/relative path to the overlay image
    [0:v][1:v] joins the two video streams together, stream 1 is the set of images, stream 2 is the overlay file
    overlay=0:0 specifies the position of the overlay, in this case the overlay image is assumed to be the same size as the video so no offset is needed. The offset is specified as overlay=x:y where x is the x offset in pixels and y is the y offset in pixels

You can use this technique to overlay multiple files on top of each other, or even have a dynamic overlay. -filter_complex is a really flexible command and can do much much more than is shown here. See the ffmpeg filters documentation for more information.
Adding a mp3 to a video

Adding sound to a video is straightforward

```bash
    $ ffmpeg -r 60 -f image2 -s 1280x720 -i pic%05d.png -i MP3FILE.mp3 -vcodec libx264 -b 4M -vpre normal -acodec copy OUTPUT.mp4 
```

    -i MP3FILE.mp3 The audio filename
    -acodec copy Copies the audio from the input stream to the output stream

Converting a video to mp4 from a different format

If the video has already been compressed the following can be used to change the codmpression to h264:

```bash
    $ ffmpeg  -i INPUT.avi -vcodec libx264 -crf 25 OUTPUT.mp4
```

Playback Issues for Quicktime/Other Codecs

Quicktime and some other codecs have trouble playing certain pixel formats such as 4:4:4 Planar and 4:2:2 Planar while 4:2:0 seems to work fine

Add the following flag to force the pixel format:

-pix_fmt yuv420p

Finer Bitrate control (to control size and quality)

 -b 4M

you can use the -b flag to specify the target bitrate, in this case it is 4 megabits per second
Using -vpre with a setting file

 -vpre normal

-vpre is the quality setting, better quality takes longer to encode, some alternatives are: default, normal, hq, max. Note that the -vpre command only works if the corresponding setting file is available.

---

Example of a working frame encoding:
    
```bash
    $ ffmpeg -r 60 -f image2 -s 1920x1080 -i frame%03d.png -c:v:1 libx264 -pix_fmt yuv420p test.mp4
    ffmpeg version 4.2.1 Copyright (c) 2000-2019 the FFmpeg developers
      built with gcc 4.8.5 (GCC) 20150623 (Red Hat 4.8.5-39)
      configuration: 
      libavutil      56. 31.100 / 56. 31.100
      libavcodec     58. 54.100 / 58. 54.100
      libavformat    58. 29.100 / 58. 29.100
      libavdevice    58.  8.100 / 58.  8.100
      libavfilter     7. 57.100 /  7. 57.100
      libswscale      5.  5.100 /  5.  5.100
      libswresample   3.  5.100 /  3.  5.100
    Input #0, image2, from 'frame%03d.png':
      Duration: 00:00:00.58, start: 0.000000, bitrate: N/A
        Stream #0:0: Video: png, rgb24(pc), 1080x1920 [SAR 1:1 DAR 9:16], 60 tbr, 60 tbn, 60 tbc
    File 'test.mp4' already exists. Overwrite ? [y/N] y
    Stream mapping:
      Stream #0:0 -> #0:0 (png (native) -> mpeg4 (native))
    Press [q] to stop, [?] for help
    Output #0, mp4, to 'test.mp4':
      Metadata:
        encoder         : Lavf58.29.100
        Stream #0:0: Video: mpeg4 (mp4v / 0x7634706D), yuv420p, 1080x1920 [SAR 1:1 DAR 9:16], q=2-31, 200 kb/s, 60 fps, 15360 tbn, 60 tbc
        Metadata:
          encoder         : Lavc58.54.100 mpeg4
        Side data:
          cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: -1
    frame=   35 fps=0.0 q=31.0 Lsize=     755kB time=00:00:00.56 bitrate=10917.9kbits/s speed=0.815x    
    video:754kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.132701%
```

---

## Miscellaneous

---
