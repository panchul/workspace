# OpenCV

https://opencv.org/

- [Installing](#Installing)
- [Tutorials and Demos](#Tutorials-and-Demos)
- [Integration with IDEs](#Integration-with-IDEs)

See also:

  - [ComputerVision](ComputerVision.md)
  - [CUDA](CUDA.md)
  - [OpenACC](OpenACC.md)
  - [Open3D](Open3D.md)
  - [OpenGL](OpenGL.md)
  - [PIL](PIL.md)

See my Python and C++ sandboxes for useful snippets:

 - https://github.com/panchul/sb_python
 - https://github.com/panchul/sb_cpp 

## Installing

Installing from the source codes on MacOS Catalina
https://medium.com/analytics-vidhya/installing-opencv-3-from-source-on-macos-catalina-cefc71e2fda

Another link:
https://www.pyimagesearch.com/2019/01/30/macos-mojave-install-tensorflow-and-keras-for-deep-learning/

Here's the 4.3.0 (latest stable tag righ now)
https://docs.opencv.org/4.3.0/d0/db2/tutorial_macos_install.html

On Mac I did with and c examples:

    $ git clone <opencv>
    $ git clone <opencv_contrib>
    $ cd opencv
    $ mkdir build
    $ cd build
    $ cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/Users/iam/OpenCV/opencv/build -D INSTALL_C_EXAMPLES=ON \
     -D BUILD_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=/Users/iam/OpenCV/opencv_contrib/modules ../

Also needs `-D OPENCV_GENERATE_PKGCONFIG=YES`, like so:

    $ cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/Users/iam/OpenCV/opencv/build \
     -D INSTALL_C_EXAMPLES=ON  -D BUILD_EXAMPLES=OFF -D OPENCV_EXTRA_MODULES_PATH=/Users/iam/OpenCV/opencv_contrib/modules \
     -D OPENCV_GENERATE_PKGCONFIG=ON ../

Now the package file shows up in `unix-install/opencv4.pc`

On Ubuntu I also had to add `-D CMAKE_SHARED_LINKER_FLAGS=-W1,Bsymbolic`, as described in 
https://answers.opencv.org/question/63331/opencv-30-wont-compile-with-ffmpeg-support/

It will take a while. Do NOT use `-j` without a number - it may overflood your cpu and system memory. Use whatever cores you have.     
     
    $ make -j8
    ...

Might need `sudo` for Linux, worked without sudo in our configuration(local, with sudo only for copying .pc):    
        
    $ make install
    ...
    
Update the path to dlls, in `.bash_profile`(or .bashrc, or.zshrc, etc.) add:
    
    export DYLD_LIBRARY_PATH=/Users/iam/OpenCV/opencv/build/lib:$DYLD_LIBRARY_PATH

On Mac, copy .pc file (THIS PART DID NOT WORK):

    $ cp /Users/iam/OpenCV/opencv/build/lib/pkgconfig/opencv.pc /usr/local/lib/pkgconfig/opencv4.pc

This works:    
    
    $ cp /Users/iam/OpenCV/opencv/build/unix-install/opencv4.pc /usr/local/lib/pkgconfig/opencv4.pc

From here: https://prateekvjoshi.com/2013/10/18/package-opencv-not-found-lets-find-it/

You can fake it, by creating your own opencv.pc file in `/usr/local/lib/pkgconfig`, or wherever the
`PKG_CONFIG_PATH` points to:

    prefix=/usr
    exec_prefix=${prefix}
    includedir=${prefix}/include
    libdir=${exec_prefix}/lib
    
    Name: opencv
    Description: The opencv library
    Version: 2.x.x
    Cflags: -I${includedir}/opencv -I${includedir}/opencv2
    Libs: -L${libdir} -lopencv_calib3d -lopencv_imgproc -lopencv_contrib -lopencv_legacy

And add this to the .bash_profile:

    export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/:$PKG_CONFIG_PATH   

Reload or `source` the .bash_profile, and try compiling a sample:

    $ g++ -ggdb `pkg-config --cflags --libs opencv3` -stdlib=libstdc++ opencv_version.cpp -o /tmp/opencv_version && /tmp/opencv_version

This one worked(on Mac, and linux):

    $ g++ -std=c++1z `pkg-config --cflags --libs opencv4` opencv_version.cpp -o ~/tmp/opencv_version && ~/tmp/opencv_version
      Welcome to OpenCV 4.3.0

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

`make -j` blew up the memory in the VM on VirtualBox, used non-parallel, or limiting the number of threads:

    $ make -j4
  
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

Installing OpenCV4 on MacOS
https://www.pyimagesearch.com/2018/08/17/install-opencv-4-on-macos/

---

## Tutorials and Demos

---

Converting from PyTorch to TF to speeup, using ONNX
https://www.learnopencv.com/how-to-convert-a-model-from-pytorch-to-tensorrt-and-speed-up-inference

---

Another tutorial, smile detection. 
https://morioh.com/p/91b4314ae79d

---

Another video with a tutorial, says learn it in 3 hours.
https://www.youtube.com/watch?v=WQeoO7MI0Bs

---

Neat samples for i/o of videos using cpp or python
https://www.learnopencv.com/read-write-and-display-a-video-using-opencv-cpp-python/

---

Simple Motion detector using OpenCV 
https://www.youtube.com/watch?v=aqxVCisTRDg

    import cv2
    cap = cv2.VideoCapture(0)
    _, first = cap.read()
    
    while True:
        _, second = cap.read()
        orig = second.copy()
        diff = cv2.absdiff(second, first)
        gray = cv2.cvtColor(diff, cv2.COLOR_BGR2GRAY)
        _, th = cv2.threshold(gray, 25, 255, cv2.THRESH_BINARY)
        _,contors,_ = cv2.findContours(th, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        for contor in contors:
            if cv2.contourArea(contor) > 5000:
                (x,y,w,h) = cv2.boundingRect(contor)
                cv2.rectangle(orig, (x,y), (x+w, y+h), (0,255,0), 3)
                cv2.putText(orig, "MOTION-DETECTED", (20, 400), cv2.FONT_HERSHEY_SIMPLEX, 1, (0,0,255), 3)

        cv2.imshow("", orig)
        first = second.copy()
        if cv2.waitKey(1) == 27:
            break
  
    cap.release()
    cv2.destroyAllWindows()

---

Another MNIST sample, with a cute gui, from https://www.youtube.com/watch?v=qmY36LzdPHo :

    import tensorflow as tf
    import cv2
    import numpy as np
    import matplotlib.pyplot as plt
    from tensorflow.keras.models import load_model
    
    dataset = tf.keras.datasets.mnist
    (X_train, y_train), (X_test, y_test) = dataset.load_data()
    
    # normalize 0.0-1.0
    X_train= X_train/255.0
    X_test= X_test/255.0
    
    ### CNN (BATCH , HEIGHT, WIDTH, 1)
    #### ANN (BATCH_SIZE, FEATURES)
    #### FEATURES = WIDTH * HEIGHT
    #### reshape array to fit in network ####
    
    X_train = X_train.reshape(X_train.shape[0], -1)
    X_test = X_test.reshape(X_test.shape[0], -1)
    # (batch_size, height, width, 1)
    
    from tensorflow.keras.models import Sequential
    from tensorflow.keras.layers import Dense, Dropout
    
    # 0-1
    model = Sequential()
    model.add(Dense(128, activation='relu'))
    model.add(Dropout(0.2))
    
    model.add(Dense(128, activation='relu'))
    model.add(Dropout(0.2))
    
    # [0-9]
    model.add(Dense(10, activation='softmax'))
    
    model.compile('adam', 'sparse_categorical_crossentropy', metrics=['acc'])
    model.fit(X_train, y_train, epochs=3, batch_size=12, validation_split=0.1)
    
    # making prediction
    plt.imshow(X_test[1255].reshape(28,28), cmap='gray')
    plt.xlabel(y_test[1255])
    plt.ylabel(np.argmax(model.predict(X_test)[1255]))
    
    model.save('digit_trained.h5')
    
    # open cv for capture and predicting through camera
    '''
    cap = cv2.VideoCapture(0)
    while True:
        ret, img = cap.read()
        #img = cv2.flip(img, 1)
        img = img[200:400, 200:400]
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        _, gray = cv2.threshold(gray, 127, 255, cv2.THRESH_BINARY_INV)
        cv2.imshow("gray_wind", gray)
        gray = cv2.resize(gray, (28, 28))
        #cv2.imshow('resized')
        gray = gray.reshape(1, 784)
        result = np.argmax(model.predict(gray))
        result = 'cnn : {}'.format(result)
        cv2.putText(img, org=(25,25), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, text= result, color=(255,0,0), thickness=1)
        cv2.imshow("image", img)
       
        if cv2.waitKey(1) == 13:
            break
    cap.release()
    cv2.destroyAllWindows()
    #plt.imshow(img)
    '''
    
    run = False
    ix,iy = -1,-1
    follow = 25
    img = np.zeros((512,512,1))
    
    def draw(event, x, y, flag, params):
        global run,ix,iy,img,follow
        if event == cv2.EVENT_LBUTTONDOWN:
            run = True
            ix, iy = x, y
        elif event == cv2.EVENT_MOUSEMOVE:
            if run == True:
                cv2.circle(img, (x,y), 20, (255,255,255), -1)
    
        elif event == cv2.EVENT_LBUTTONUP:
            run = False
            cv2.circle(img, (x,y), 20, (255,255,255), -1)
            gray = cv2.resize(img, (28, 28))
            gray = gray.reshape(1, 784)
            result = np.argmax(model.predict(gray))
            result = 'cnn : {}'.format(result)
            cv2.putText(img, org=(25,follow), fontFace=cv2.FONT_HERSHEY_SIMPLEX, fontScale=1, text= result, color=(255,0,0), thickness=1)
            follow += 25
        elif event == cv2.EVENT_RBUTTONDOWN:
            img = np.zeros((512,512,1))
            follow = 25
    
    cv2.namedWindow('image')
    cv2.setMouseCallback('image', draw)
    
    while True:    
        cv2.imshow("image", img)
        if cv2.waitKey(1) == 27:
            break
    
    cv2.destroyAllWindows()

---

Neat face recognition sample code

Liveness Detection with OpenCV
https://www.pyimagesearch.com/2019/03/11/liveness-detection-with-opencv/

---

How to use OpenCV's "dnn" module with NVidia GPUs CUDA and cuDNN
https://www.pyimagesearch.com/2020/02/03/how-to-use-opencvs-dnn-module-with-nvidia-gpus-cuda-and-cudnn/

---

For Computer Vision there is a good resource, 
course CS231N by Stanford University.

https://www.youtube.com/watch?v=vT1JzLTH4G4&list=PL3FW7Lu3i5JvHM8ljYj-zLfQRF3EO8sYv

---

Open CV playlist with overview:
https://www.youtube.com/playlist?list=PLfPtpZzK2Z_Tt1UaK7LipnbNCb_VR4Sv_

---

1,5 hour video, with a tutorial:
Digits Classification/Regocgnition Using Convolution Neural Networks CNN/OpenCV Python.
https://www.youtube.com/watch?v=y1ZrOs9s2QA

---

## Integration with IDEs

---

Nice overview of using with Eclipse:
https://docs.opencv.org/4.1.1/d7/d16/tutorial_linux_eclipse.html

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

or subpage [Tesseract.md](Tesseract.md)

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

Capturing images

    import cv2
    import numpy as np
    capture=cv2.VideoCapture(0)
    frame_width=int(capture.get(3))
    frame_height=int(capture.get(4))
    frame_index=1
    
    if capture.isOpened is False:
        print("error while opening the camera")
    
    while capture.isOpened():
        ret,frame=capture.read()
        if ret is True:
            cv2.imshow("input frame",frame)
            #grayframe=cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
            #cv2.imshow("gray frame",grayframe)
    
            mykey = cv2.waitKey(10) & 0xFF
            if mykey == ord('c'):
                framename="camera_frame{}.png".format(frame_index)
                cv2.imwrite(framename,frame)
                frame_index=frame_index+1
            else:
                if mykey == ord('q'):
                    break
        else:
            break
    
    capture.release()
    cv2.destroyAllWindows()

---
