# Django

See Also:

  - [Pip](Pip.md)
  - [PyCharm](PyCharm.md)
  - [Python](Python.md)

**Content**

- [Installing](Django.md#Installing)
- [Creating a project](Django.md#Creating-a-project)
- [Miscellaneous](Django.md#Miscellaneous)

---

## Installing

---

If you created your own Pyton environment, which is a best practice, this should do it:

    $ python -m pip install django

---

## Creating a project

---

To start a new project `myprojectname`:

    $ django-admin startproject myprojectname

It will create the needed files and subfolder `myprojectname`. Go there and run:

    $ cd myprojectname
    $ python manage.py runserver

It runs a development server. It shows the url where it hosts it, http://127.0.0.1:8000. `Ctrl-C` to stop it.

    $ python manage.py startapp website


    





---

## Miscellaneous

---

Simple tutorial to mix Django, Docker, and PostgreSQL
https://dev.to/learndjango/django-docker-and-postgresql-tutorial-be3

---