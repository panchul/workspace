
## UNDER CONSTRUCTION

# Python

https://www.python.org/


My Python sandbox is [https://github.com/panchul/sb_python](https://github.com/panchul/sb_python).

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
1. ```os.system("some_command with args")``` passes the command and arguments to your system's shell. This is nice because you can actually run multiple commands at once in this manner and set up pipes and input/output redirection. For example:

    os.system("some_command < input_file | another_command > output_file")  

However, while this is convenient, you have to manually handle the escaping of shell characters such as spaces, etc. On the other hand, this also lets you run commands which are simply shell commands and not actually external programs.

2.```stream = os.popen("some_command with args")``` will do the same thing as os.system except that it gives you a file-like object that you can use to access standard input/output for that process. There are 3 other variants of popen that all handle the i/o slightly differently. If you pass everything as a string, then your command is passed to the shell; if you pass them as a list then you don't need to worry about escaping anything. See the documentation.

3. The Popen class of the subprocess module. This is intended as a replacement for os.popen but has the downside of being slightly more complicated by virtue of being so comprehensive. For example, you'd say:

```print subprocess.Popen("echo Hello World", shell=True, stdout=subprocess.PIPE).stdout.read()```

instead of:

```print os.popen("echo Hello World").read()```

but it is nice to have all of the options there in one unified class instead of 4 different popen functions.

4. The call function from the subprocess module. This is basically just like the Popen class and takes all of the same arguments, but it simply waits until the command completes and gives you the return code. For example:

```return_code = subprocess.call("echo Hello World", shell=True)```  

5. If you're on Python 3.5 or later, you can use the new subprocess.run function, which is a lot like the above but even more flexible and returns a CompletedProcess object when the command finishes executing.

6. The os module also has all of the fork/exec/spawn functions that you'd have in a C program, but I don't recommend using them directly.

The subprocess module should probably be what you use.

Finally please be aware that for all methods where you pass the final command to be executed by the shell as a string and you are responsible for escaping it. There are serious security implications if any part of the string that you pass can not be fully trusted. For example, if a user is entering some/any part of the string. If you are unsure, only use these methods with constants. To give you a hint of the implications consider this code:

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