# numpy

https://numpy.org/doc/stable/user/quickstart.html

See also:

  - [Anaconda](Anaconda.md)
  - [Jupyter](Jupyter.md)
  - [PIL](PIL.md)
  - [Python](Python.md)

---

Some basics of numpy arrays.

    >>> arr = np.arange(4)
    array([0,1,2,3])
    >>> arr = np.random.randint(0,100,10)
    >>> arr
    array([36, 64, 71, 14, 72, 12, 86, 70, 52, 39])
    >>> arr.reshape((2,5))
    array([[36, 64, 71, 14, 72],
           [12, 86, 70, 52, 39]])
    >>> arr.mean()
    51.6
    >>> arr.argmax()
    6
    >>> arr.max()
    86
    >>> arr.shape
    (10,)
  
    >>> arr2 = arr.reshape((2,5))
    >>> arr2[0][1]
    40
    >>> arr2[0,1]
    40

---
