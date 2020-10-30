# TensorFlow

https://www.tensorflow.org/

https://github.com/tensorflow/tensorflow

---

A podcast where the guy says tensorflow is crap.
https://www.youtube.com/watch?v=XHyASP49ses

---

Distributed TensofFlow
https://github.com/tensorflow/examples/blob/master/community/en/docs/deploy/distributed.md

This one also seems to have some concrete examples
https://www.ionos.com/community/server-cloud-infrastructure/tensorflow/set-up-a-distributed-tensorflow-cluster-on-cloud-servers/

---

A tapestry of Q&A
https://www.javatpoint.com/tensorflow-interview-questions

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

