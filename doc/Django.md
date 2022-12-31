# Django

See Also:

  - [Certbot](Certbot.md)
  - [Pip](Pip.md)
  - [PyCharm](PyCharm.md)
  - [Python](Python.md)
  - [Flask](Flask.md)
  - [Gunicorn](Gunicorn.md)
   

**Content**

- [Installing](Django.md#Installing)
- [Creating a project](Django.md#Creating-a-project)
- [Migrations](Django.md#Migrations)
- [Templates](Django.md#Templates)
- [Static](Django.md#Static)
- [Url patterns](Django.md#Url-patterns)
- [Model Forms](Django.md#Model-forms)
- [Deployment and maintenance](Django.md#Deployment-and-maintenance)
- [Debugging](Django.md#Debugging)
- [Caching](Django.md#Caching)
- [Testing](Django.md#Testing)
- [Miscellaneous](Django.md#Miscellaneous)

---

## Installing

---

If you created your own Pyton environment, which is a best practice, this should do it:

    $ python -m pip install django

---

PyCharm has a wizard to do a Django project, but not in the free Community Edition.
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

You need to run the migrations:
    
    $ python manage.py migrate

There is an admin user you can create:
    
    $ python manage.py createsuperuser

It will ask for username and password.

## Migrations

You need to have your app in INSTALLED_APS.

First step is to write the model code (or change). The model should inherit from models, and that
model is also should be registered for admin interface, as `admin.site.register(Mymodelclassname)`.
You can now open in browser the link /admin, and create or manipulate the objects of that model class.


The second step is to generate a migration.

    $ python manage.py makemigrations

To see the migrations(the ones you generated, or from before):

    $ python manage.py showmigrations

Apply migrations

    $ python manage.py migrate

To look at the result of the applying migrations, you can use:

    $ python manage.py dbshell

In case of SQLite, you can type `.tables` to see the tables, etc.

To see what the migration will do in sql(`0001` is a partial migration name, it will look it up):

    $ python manage.py sqlmigrate myappname 0001

---

## Templates

---

Еhe templates should be in `templates` folder. The dictionary keys are in `{{}}`

---

The `for` loop looks something like this:

    <ul>
        {% for A in As %}
          whatever, usually <li>
            {{A}}   ----- the one that has __str__ implemented
        {% endfor %}
    </ul>

Template inheritance is using:

    {% extends "base.html" %}

The blocks have names, you can overwrite the content of a block like so:

    {% block block_name %}
        here goes the stuff
    {% endblock %}

---

## Static

---

By convention, `static` folder is for the static content, .css, pictures, etc.

    {% load static %}
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <link rel="stylesheet"
            href="{% static 'website/style.css' %}">

---

## Url patterns

---

Example of the mapping:

    urlpatterns = [
        path('<int:id>', detail)
    ]

You can reference mapping from another location using `include`

    urlpatterns = [
        path('<int:id>', detail),
        path('meetings/', include('meetings.urls')),
    ]

---

## Model forms

---

`ModelForm` class does it.

---

## Deployment and maintenance

---

Django deployment doc page:

https://docs.djangoproject.com/en/4.1/howto/deployment/

---

Running Django with the warnings about deprecation, use `-Wa` flag:

    $ python -Wa manage.py runserver

---

To use a different port:

    $ python manage.py runserver 0.0.0.0:8080

You may need to allow the access to this port, see what the check says: 

    $ python manage.py check --deploy

---

As a quick-and-dirty deployment to port 80, point to the proper venv executable:

    $ sudo /home/alexp/venv/bin/python manage.py runserver 80

A broader discussion on permissions and best practices:

https://stackoverflow.com/questions/37434247/django-error-you-dont-have-permission-to-access-that-port

---

## Debugging

---

Several things to do to get the Django-debug-toolbar.

In the right venv, install the package:

    $ pip install django-debug-toolbar

Add the URL path:

    urlpatterns = [
        ...
        path('__debug__/', include(debug_toolbar.urls)),
    ]

Add the debug toolbar to the INSTALLED_APS list:

    INSTALLED_APPS = [
        'django.contrib.staticfiles',
        #...
        'debug_toolbar',
    ]

Add MIDDLEWARE:

    MIDDLEWARE = [
        # ...
        'debug_toolbar.middleware.DebugToolbarMiddleware',
    ]

Add internal IPs:

    INTERNAL_IPS = [
        # ...
        '127.0.0.1',
    ]

Add Django toolbar panels:

    DEBUG_TOOLBAR_PANELS = [
        # ...
        'debug_toolbar.panels.sql.SQLPanel',
        'debug_toolbar.panels.templates.TemplatesPanel',
    ]

---

## Caching

---

Use decorators, and build-in cache.

---

## Testing

---

Built-in test discovery pick up any `test*.py`, but a better practice to create a sub-directory for tests,
for example a module ModuleName and views/forms for that test:

    ModuleName/tests/__init__.py
    ModuleName/tests/test_views.py
    ModuleName/tests/test_form.py

Then you can run tests using:

    $ python manage.py test

Or specify

    $ python manage.py test ModuleName

---

There is a dummy browser package, `django.test.Client`.


---

## Miscellaneous

---

Simple tutorial to mix Django, Docker, and PostgreSQL
https://dev.to/learndjango/django-docker-and-postgresql-tutorial-be3

---

`get_object_or_404()` is a simple way to handle exceptions

---