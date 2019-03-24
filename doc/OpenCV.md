

## UNDER CONSTRUCTION

# OpenCV

See also:

- [OpenGL](OpenGL.md)
- [CUDA](CUDA.md)

https://opencv.org/

---

Nice step-by-step install on Ubuntu is here:
https://www.learnopencv.com/install-opencv3-on-ubuntu/

---

Some troubleshooting for sample files came down to:
"CV_LOAD_IMAGE_COLOR" has been replaced with "cv::IMREAD_COLOR"

---

Installing on MacOS
https://www.pyimagesearch.com/2018/08/17/install-opencv-4-on-macos/

---

Same link has a nice Document Scanner app as a test.
https://www.pyimagesearch.com/2018/08/17/install-opencv-4-on-macos/

https://www.pyimagesearch.com/2014/09/01/build-kick-ass-mobile-document-scanner-just-5-minutes/

---

Whole lot of dependencies are needed for opancv to work, for example:

    sudo apt update
    sudo apt install tesseract-ocr
    sudo apt install libtesseract-dev

On Mac:

    $ brew install tesseract
    $ brew install tesseract-lang
    $ python3.6 -m pip install tesseract

    $ pip3 install --upgrade tensorflow

Or, with the list:

    $ pip3 install -r requirements.txt

---

About Tesseract, it uses http://leptonica.com/


---

Neat face recognition sample code

Liveness Detection with OpenCV
https://www.pyimagesearch.com/2019/03/11/liveness-detection-with-opencv/

---