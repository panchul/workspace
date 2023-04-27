# Computer Vision

The things that did not fit the pages for the libraries/frameworks.

See Also:

  - [CUDA](CUDA.md)
  - [Graphics](Graphics.md)
  - [OpenCV](OpenCV.md)
  - [Yolo](Yolo.md)

---

Contents

- [LIDAR](ComputerVision.md#LIDAR)
- [Miscellaneous](ComputerVision.md#Miscellaneous)

---

## LIDAR

---

https://gitlab.kitware.com/keu-computervision/slam/

Our SLAM algorithm computes the vehicle motion solely based on Lidar
data from Velodyne Lidar, Inc. #VLP16 here). No GNSS/IMU involved.
I still find this mesmerizing, even after years working with such data.
The rendered video shows the viewpoint from the (computed) Lidar position,
it shows the reconstructed surroundings, as well as the vehicle motion.
(We show points 5 seconds ahead for better visualization)
Yes, we've quite some speed bumper in #Lyon, #France, where Kitware Europe
is.

The code is here: https://lnkd.in/ghNKsyp
It's Apache 2.0, standalone C++, with wrappers for |ROS and LidarView
ParaView VeloView

If it seems a useful base for collaboration, contact our Kitware Inc.
team via our web site https://lnkd.in/eCW5WGK or directly me.
lidar mapping

---

## Miscellaneous

---

COCO-WholeBody dataset is the first large-scale benchmark for whole-body pose estimation.
It is an extension of COCO 2017 dataset with the same train/val split as COCO.
For project and code/API/expert requests: https://www.catalyzex.com/paper/arxiv:2007.11858

https://github.com/jin-s13/COCO-WholeBody

For each person, they annotate 4 types of bounding boxes (person box, face box, left-hand
box, and right-hand box) and 133 keypoints (17 for body, 6 for feet, 68 for face and 42 for hands).
Get the free ML code finder browser extension:
Chrome https://bit.ly/code_finder_chrome
Firefox https://bit.ly/code_finder_firefox.

---

Sceenshot taking using Python and `pyautogui`
https://www.youtube.com/watch?v=ZfoDtD9xEvw

---

An example of Semantic Segmentation + Background Removal + Style Transfer:
https://colab.research.google.com/drive/1-TdFn92AynDLqOvRfZHbDeljZOC0XwIp

---

Simple Motion detector using OpenCV 
https://www.youtube.com/watch?v=aqxVCisTRDg
https://gist.github.com/Pawandeep-prog/17e064386bde8b97b16d8ee5c91de26a

---

Mask RCNN using Tensorflow and Cuda
https://www.immersivelimit.com/tutorials/mask-rcnn-for-windows-10-tensorflow-2-cuda-101

---

Computer Vision courses from Stanford University 
course CS231N by Stanford University.
https://www.youtube.com/watch?v=vT1JzLTH4G4&list=PL3FW7Lu3i5JvHM8ljYj-zLfQRF3EO8sYv

---

Neat Detect/Recognize license plates with ML and Python. Wpod-Net
https://medium.com/@quangnhatnguyenle/detect-and-recognize-vehicles-license-plate-with-machine-learning-and-python-part-1-detection-795fda47e922

https://github.com/quangnhat185/Plate_detect_and_recognize

This is probably the source, it has the training script, not just importing the weights.
https://github.com/sergiomsilva/alpr-unconstrained

web page for it:
http://sergiomsilva.com/pubs/alpr-unconstrained/

---

Cute project of identifying objects on a conveyor belt.
https://pysource.com/2020/05/19/identify-objects-moving-on-a-conveyor-belt-using-opencv-with-python/
https://morioh.com/p/f2254262e3e1

---

Depth estimation
https://github.com/saeid-h/bts-fully-tf

The paper.
https://arxiv.org/src/1907.10326v4/anc/bts_sm.pdf

---

Another video with a walk-through on Yolo3
https://www.youtube.com/watch?v=saDipJR14Lc

--- 

Computer Vision courses from the guy who made YOLO
https://www.youtube.com/playlist?list=PLjMXczUzEYcHvw5YYSU92WrY8IwhTuq7p

--- 

YOLO article with good references and step-by-step demos
https://robocademy.com/2020/05/01/a-gentle-introduction-to-yolo-v4-for-object-detection-in-ubuntu-20-04/

--- 

Nice Computer Vision summary, Spectral Graph Convolution step-by-step.
https://towardsdatascience.com/spectral-graph-convolution-explained-and-implemented-step-by-step-2e495b57f801

---

Integrating Keras (TensorFlow) YOLOv3 Into Apache NiFi Workflows
https://community.hortonworks.com/articles/193868/integrating-keras-tensorflow-yolov3-into-apache-ni.html

---

Simple bar-code reader using pyzbar (see my Python sandbox, (https://github.com/panchul/sb_python) 

    >>> from pyzbar import pyzbar
    >>> from PIL import Image
    >>> info = pyzbar.decode(Image.open('sample_barcode.png'))
    >>> print(info)
    [Decoded(data=b'https://barcodesegypt.com', type='QRCODE', rect=Rect(left=190, top=97,
    width=76, height=76), polygon=[Point(x=190, y=97), Point(x=190, y=173), Point(x=266, y=173),
    Point(x=266, y=97)]), Decoded(data=b'https://www.samsung.com/au/support/', type='QRCODE',
    rect=Rect(left=193, top=6, width=72, height=72), polygon=[Point(x=193, y=6), Point(x=193,
    y=77), Point(x=265, y=78), Point(x=264, y=6)]), Decoded(data=b'https://l.ead.me/api-1',
    type='QRCODE', rect=Rect(left=370, top=3, width=77, height=77), polygon=[Point(x=370, y=3),
    Point(x=371, y=80), Point(x=446, y=79), Point(x=447, y=4)]),
    Decoded(data=b'http://en.m.wikipedia.org', type='QRCODE', rect=Rect(left=17, top=15,
    width=147, height=147), polygon=[Point(x=17, y=15), Point(x=17, y=162), Point(x=164,
    y=162), Point(x=164, y=15)])]
    
A Python script to extract the codes from the camera feed:

    # pip install opencv-python 
    # pip install pillow 
    # The zbar DLLs are included with the Windows Python wheels. On other operating systems,
    # you will need to install the zbar shared library.
    #  Mac OS X: brew install zbar
    #  Linux: 
    # sudo apt-get install libzbar0
    # pip install pyzbar
    # Window :
    #  pip install pyzbar
    
    import cv2
    from pyzbar import pyzbar
    from PIL import Image
    
    def read_barcodes(frame):
        barcodes = pyzbar.decode(frame)
        for barcode in barcodes:
            x, y , w, h = barcode.rect
            barcode_text = barcode.data.decode('utf-8')
            print(barcode_text)
            cv2.rectangle(frame, (x, y),(x+w, y+h), (0, 255, 0), 2)
        return frame
    
    def main():
        camera = cv2.VideoCapture(0)
        ret, frame = camera.read()
        while ret:
            ret, frame = camera.read()
            frame = read_barcodes(frame)
            cv2.imshow('Barcode reader', frame) # Shows the image
            if cv2.waitKey(1) & 0xFF == 27:     # Esc key stops the loop
                break
    
        camera.release()
        cv2.destroyAllWindows()
    
    if __name__ == '__main__':
        main()

---

One-liner text recognition using PyTesseract:
(from this post: https://morioh.com/p/177cde94de0e)

Pre-requisites:

    $ pip install opencv-python
    $ sudo apt-get update
    $ sudo apt-get install tesseract-ocr
    $ sudo apt-get install libtesseract-dev
    $ pip install pytesseract

Might need to add the `tesseract_cmd`, might be for Windows though:

    import cv2
    import pytesseract
    pytesseract.pytesseract.tesseract_cmd = r'c:\\Program Files\\Tesseract-OCR\\tesseract.exe'

The Python code itself:

    import cv2
    import pytesseract
    
    img = cv2.imread('somefile.png')
    text = pytesseract.image_to_string(img)
    print(text)

---

Basic interview questions

- Basic filters (high pass, low pass)
- difference between convolution and correlation
- edge detection methods (Sobel filter etc)
- image smoothing and what is noise?
- image transformation like Fourier.
- Hough transform
- segmentation basics only.

---
