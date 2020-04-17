# OpenCV

See also:

- [CUDA](CUDA.md)
- [OpenACC](OpenACC.md)
- [Open3D](Open3D.md)
- [OpenGL](OpenGL.md)

https://opencv.org/

---

1,5 hour video, with a tutorial:
Digits Classification/Regocgnition Using Convolution Neural Networks CNN/OpenCV Python.
https://www.youtube.com/watch?v=y1ZrOs9s2QA

---

Nice overview of using with Eclipse:
https://docs.opencv.org/4.1.1/d7/d16/tutorial_linux_eclipse.html

---

Nice step-by-step install on Ubuntu is here(!!! for CentOs see below):
https://www.learnopencv.com/install-opencv3-on-ubuntu/

Or at OpenCV's doc:
https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html

pre-reqs

    $ sudo apt-get install build-essential
    $ sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
    $ sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

The repo. (get the .zip for the latest stable), [https://github.com/opencv/opencv](https://github.com/opencv/opencv):

    $ cd ~/<my_working_directory>
    $ git clone https://github.com/opencv/opencv.git
    $ git clone https://github.com/opencv/opencv_contrib.git

Get the extras right away too, for the test data[https://github.com/opencv/opencv_extra](https://github.com/opencv/opencv_extra):

    $ git clone https://github.com/opencv/opencv_extra.git 

I did not use the one they mention at the doc, used my own

    $ cd ~/opencv
    $ mkdir build
    $ cd build

    $ cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..

or, with modules
    
    $ cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ ..

`make -j` blew up the memory in the VM on VirtualBox, used non-parallel:

    $ make
  
 Had an error:
 
    cmake_symlink_library: System Error: Read-only file system   

A work-around is to tweak the VirtualBox:

    $ VBoxManage setextradata VM_NAME VBoxInternal2/SharedFoldersEnableSymlinksCreate/SHARE_NAME 1

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

Whole lot of dependencies are needed for OpenCV to work, for example:

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

Installing on CentOS.
From here: https://www.vultr.com/docs/how-to-install-opencv-on-centos-7

Step 1: Install dependencies for OpenCV

    $ yum groupinstall "Development Tools" -y
    $ yum install cmake gcc gtk2-devel numpy pkconfig -y

Step 2: Download the OpenCV 3.3.0 archive

    $ cd
    $ wget https://github.com/opencv/opencv/archive/3.3.0.zip
    $ unzip 3.3.0.zip

Step 3: Compile and install OpenCV 3.3.0

    $ cd opencv-3.3.0
    $ mkdir build
    $ cd build
    $ cmake -D CMAKE_BUILD_TYPE=DEBUG -D CMAKE_INSTALL_PREFIX=/usr/local ..
    $ make
    $ make install

Step 4: Configure required variables

    $ export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig/
    $ echo '/usr/local/lib/' >> /etc/ld.so.conf.d/opencv.conf
    $ ldconfig

Step 5 (optional): Run tests

    $ cd
    $ git clone https://github.com/opencv/opencv_extra.git
    $ export OPENCV_TEST_DATA_PATH=/root/opencv_extra/testdata

Run these opencv_test_* :

    $ cd /root/opencv-3.3.0/build/bin
    $ ls
    $ ./opencv_test_photo

---

Writing a Mat into a file:
https://answers.opencv.org/question/134419/from-cvmat-to-saving-image-in-a-given-formatpngjpeg/

This seem to work on a caputred frame:

    ...
    cap.read(frame);
    imwrite("next_frame.png", frame); // can use other formats.
    imshow("Live", frame);
    ...

---
