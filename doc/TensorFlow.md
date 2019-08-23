

## UNDER CONSTRUCTION

# TensorFlow

https://www.tensorflow.org/

https://github.com/tensorflow/tensorflow

---

Some issues during installation

    $ pip3 install --ignore-installed tensorflow

---

Install:

    $ pip install tensorflow

Use the GPU package for CUDA-enabled GPU cards:

    $ pip install tensorflow-gpu

    $ python
    >>> import tensorflow as tf
    >>> tf.enable_eager_execution()
    >>> tf.add(1, 2).numpy()
    3
    >>> hello = tf.constant('Hello, TensorFlow!')
    >>> hello.numpy()
    'Hello, TensorFlow!'

---

