[Home](Readme.md)
# PyCharm.md

Python SDE.

https://www.jetbrains.com/pycharm/

See Also:

  - [IntelliJ](IntelliJ.md)
  - [Visual Studio Code](VisualStudioCode.md)

---

Python virtual environments are part of IDE.

---

To create a Django process in a Community Edition, you can
do it with the command line:

Check that Django is there:

    $ python -m django --version

Install if needed:

    $ python -m pip install django
    $ python -m django --version
    $ python -m pip install --upgrade pip

Create a project:

    $ django-admin startproject firstproject

Go to that folder and run the server:
    
    $ cd firstproject
    $ python manage.py runserver
    ...
    Django version 4.1.4, using settings 'firstproject.settings'
    Starting development server at http://127.0.0.1:8000/
    Quit the server with CONTROL-C.

See your site in browser in http://127.0.0.1:8000/

To access admin panel, you need to run the migrations:

    $ python manage.py migrate

---