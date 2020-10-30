# Python

See also:

  - [Anaconda](Anaconda.md)
  - [Cython](Cython.md)
  - [Jupyter](Jupyter.md)
  - [Numpy](Numpy.md)
  - [PIL](PIL.md)

https://www.python.org/

My Python sandbox is [https://github.com/panchul/sb_python](https://github.com/panchul/sb_python).

---

Drawing COVID19 shaped virus using Turtle Library
 
    import turtle
    trt = turtle.Turtle()
    scr = turtle.Screen()
    scr.bgcolor('black')
    trt.pencolor('red')
    a = 0
    b = 0
    trt.speed(0)
    trt.penup()
    trt.goto(0,200)
    trt.pendown()
    while True:
        trt.forward(a)
        trt.right(b)
        a+=3
        b+=1
        if b == 210:
            break
        trt.hideturtle
    turtle.done()
    
---

Some .pdfs with Python books:
https://github.com/siddiquiamir/Python-Books

Loading a .csv from a web server(or github user content)

    import pandas as pd
    df = pd.read_csv("http://raw.githubusercontent.../my.csv")
    df.read()

And you can now use this data frame as you wish. 

---

Python app skeleton, with tests and Github Action pipeline
https://github.com/panchul/Pytest-Actions-Demo

https://vak.dreamwidth.org/657802.html
https://vak.dreamwidth.org/658470.html

And this one for BitBucket:
https://bitbucket.org/serge-vakulenko/pytest-pipelines-demo/src/master/

---

How to publish a package on PyPI
https://www.youtube.com/watch?v=QgZ7qv4Cd0Y

---

About starred expressions
http://yaoyao.codes/python/2016/09/25/python-starred-expression

    def func(a, b ,c):
        print(a, b, c)
    
    func(c=3, 1, 2)                # SyntaxError: positional argument follows keyword argument
    func(c=3, *(1,2))              # OK. 1 2 3
    func(c=3, **dict(a=1,b=2))     # OK. 1 2 3
    func(c=3, *(1,), **dict(b=2))  # OK. 1 2 3
    
Another one, with args

    def func(*args, **kwargs):
        print(args)
        print(kwargs)
        print(locals())
    
    func(1, a=2)
    
    # output:
    #   (1,)
    #   {'a': 2}
    #   {'kwargs': {'a': 2}, 'args': (1,)}       

---

The `"""` usage:

    print("It's a "+""" Alex's "CAR".""")
    It's a  Alex's "CAR".
    
---

Interesting nuance between a string and a list:

    >>> first="python"
    >>> second="python"
    >>> print(first is second)
    True
    >>> print(first == second)
    True
    >>> list1=[1,2,3,4]
    >>> list2=[1,2,3,4]
    >>> print(list1 is list2)
    False
    >>> print(list1==list2)
    True

---

Basic matplotlib usage. In Jupyter Notebooks, might want to use `%matplotlib inline`:

    import matplotlib
    import matplotlib.pyplot as plt
    plt.plot([0, 1, 2, 3, 4], [0, 3, 5, 9, 11])
    plt.xlabel('Months')
    plt.ylabel('Books Read')
    plt.show()
    plt.savefig('books_read.png')

---

Other pure Python vs NumPy, vs TensorFlow, vs Keras links
https://realpython.com/numpy-tensorflow-performance/
https://towardsdatascience.com/numpy-vs-tensorflow-speed-on-matrix-calculations-9cbff6b3ce04 

---

To install anaconda3, I downloaded it,

    $ chmod 755 Anaconda...
    $ ./Anaconda...
    
Added it to .zshrc    
    
    $ conda update --all --yes

From https://stackoverflow.com/questions/38109270/cv2-import-error-on-jupyter-notebook :

By default: Anaconda (jupyter notebook) has its own version of Python & packages once it has been installed on your PC.
If you have Python x.x installed on your PC, and you installed OpenCV or -whatever packages- using the package manager of this python version, it does NOT mean your jupyter notebook will get access to these python packages you installed earlier. They are not living in the same folder.
To illustrate this, open your windows CMD and write :

    $ python 

then write:

    $ import os
    $ os.path

you will get the path of your python. in my case (C:\Python35)

Now open the Anaconda Prompt and write the same commands again:

    $ python 

then write:

    $ import os
    $ os.path

you will get the anaconda's python path. In my case (C:\Users\MY_NAME\Anaconda3).

As you can see, there are two different paths of python, so make sure that your first step in diagnosing such error (No module named x) is to ask yourself whether you installed the package in the right place or not!

N.B: within Anaconda itself you can create environments, each environment may have different packages installed in it, so you also have to make sure you're in the right environment and it is the active one.

---

Best ways to add to sys.path relative to the current running script
https://stackoverflow.com/questions/8663076/python-best-way-to-add-to-sys-path-relative-to-the-current-running-script

---

Another link with useful resources on Image processing and ML
https://www.pyimagesearch.com

---

Comparison of Python IDEs
https://www.tecmint.com/best-python-ides-for-linux-programmers/

---

Matplotlib
https://matplotlib.org

---

Calling things from Python:
https://stackoverflow.com/questions/89228/calling-an-external-command-in-python

    import subprocess

    p = subprocess.Popen('ls -la', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    for line in p.stdout.readlines():
        print line,
    retval = p.wait()

More from the link:
1. ```os.system("some_command with args")``` passes the command and arguments to your system's shell.
 This is nice because you can actually run multiple commands at once in this manner and set up pipes
  and input/output redirection. For example:

    os.system("some_command < input_file | another_command > output_file")  

However, while this is convenient, you have to manually handle the escaping of shell characters such
as spaces, etc. On the other hand, this also lets you run commands which are simply shell commands
and not actually external programs.

2.```stream = os.popen("some_command with args")``` will do the same thing as os.system except that
  it gives you a file-like object that you can use to access standard input/output for that process.
  There are 3 other variants of popen that all handle the i/o slightly differently. If you pass everything
  as a string, then your command is passed to the shell; if you pass them as a list then you don't need
  to worry about escaping anything. See the documentation.

3. The Popen class of the subprocess module. This is intended as a replacement for os.popen but has
  the downside of being slightly more complicated by virtue of being so comprehensive. For example, you'd say:

```print subprocess.Popen("echo Hello World", shell=True, stdout=subprocess.PIPE).stdout.read()```

instead of:

```print os.popen("echo Hello World").read()```

but it is nice to have all of the options there in one unified class instead of 4 different popen functions.

4. The call function from the subprocess module. This is basically just like the Popen class and takes all of
  the same arguments, but it simply waits until the command completes and gives you the return code. For example:

```return_code = subprocess.call("echo Hello World", shell=True)```  

5. If you're on Python 3.5 or later, you can use the new subprocess.run function, which is a lot like the above
  but even more flexible and returns a CompletedProcess object when the command finishes executing.

6. The os module also has all of the fork/exec/spawn functions that you'd have in a C program, but I don't
  recommend using them directly.

The subprocess module should probably be what you use.

Finally please be aware that for all methods where you pass the final command to be executed by the shell
as a string and you are responsible for escaping it. There are serious security implications if any part of
the string that you pass can not be fully trusted. For example, if a user is entering some/any part of the
string. If you are unsure, only use these methods with constants. To give you a hint of the implications
consider this code:

```print subprocess.Popen("echo %s " % user_input, stdout=PIPE).stdout.read()```

and imagine that the user enters "my mama didnt love me && rm -rf /".

---

Top Python Data Science Libraries 
https://medium.com/activewizards-machine-learning-company/top-20-python-libraries-for-data-science-in-2018-2ae7d1db8049


---

Python vs R vs SAS
https://www.datanami.com/2018/07/19/python-gains-traction-among-data-scientists/

---

Why Python is slow.
https://hackernoon.com/why-is-python-so-slow-e5074b6fe55b

---

Keras link
https://keras.io/

---

Python IDEs, etc.

PyCharm IDE (Jetbrains)
https://www.jetbrains.com/help/pycharm/meet-pycharm.html

Spyder IDE (Anaconda, WinPython, Python(x,y) )
Conda
TFDebug, TensorBoard, Jupiter

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

Pattern matching

    import re
    Test_String = raw_input()
    Regex_Pattern = r'sometext'	
    match = re.findall(Regex_Pattern, Test_String)
    print "Number of matches :", len(match)

---

Introduction to Deep Learning with Keras and Tensorflow (2018)
https://www.youtube.com/watch?v=45MbmHQ5iMY

And the snippets of code for it:
https://github.com/rragundez/PyDataAmsterdam2018

https://github.com/jupyter
http://jupyter.org/widgets
https://nbformat.readthedocs.io/en/latest/format_description.html

---

More Machine Learning links:
https://docs.scipy.org

---

Pandas Dataframe.

https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html

---

A simple demo of pre-defined things in a Python script.
(from https://stackoverflow.com/questions/419163/what-does-if-name-main-do)

File `one.py`
    
    def func():
        print("func() in one.py")

    print("top-level in one.py")

    if __name__ == "__main__":
        print("one.py is being run directly")
    else:
        print("one.py is being imported into another module")

File `two.py`

    import one

    print("top-level in two.py")
    one.func()

    if __name__ == "__main__":
        print("two.py is being run directly")
    else:
        print("two.py is being imported into another module")
    
Now, if you invoke the interpreter as

    $ python one.py

The output will be

    top-level in one.py
    one.py is being run directly

If you run two.py instead:

    $ python two.py

You get

    top-level in one.py
    one.py is being imported into another module
    top-level in two.py
    func() in one.py
    two.py is being run directly

Thus, when module one gets loaded, its __name__ equals "one" instead of "__main__".

---

Simple snippet to shutdown the computer:

    import os
    os.system("shutdown /s")

or, more elaborate:

    check = input("shutdow? (y/n)")
    if(check =="n"):
        exit()
    else:
        os.system("shutdown /s")
        
---
