
## UNDER CONSTRUCTION

# Python

My Python sandbox is [https://github.com/panchul/sb_python](https://github.com/panchul/sb_python).

---

Keras link
https://keras.io/

---

Python IDEs, etc.

PyCharm IDE (Jetbrains)
https://www.jetbrains.com/help/pycharm/meet-pycharm.html

Spyder IDE (Anaconda, WinPython, Python(x,y) )
Conda

---

Simple birthday attack calculator(from wikipedia.org). Write this into ```birthday.py```:

    from math import log1p, sqrt
    
    def birthday(probability_exponent, bits):
        probability = 10. ** probability_exponent
        outputs     =  2. ** bits
        return sqrt(2. * outputs * -log1p(-probability))

And you can run in a REPL like so:

    $ python -i birthday.py
    >>> birthday(-15, 128)
    824963474247.1193
    >>> birthday(-6, 32)
    92.68192319417072

---

Neat summary about functions:
http://devarea.com/python-writing-functions-complete-guide

---

