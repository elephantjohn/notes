# make nima-gpu application to swagger-ui

## make nima-gpu application to flask

```
see Gitlab/srx/labs, run that by "env and flask run"
```

## make flask to swagger-ui

see [here](https://github.com/Sean-Bradley/Seans-Python3-Flask-Rest-Boilerplate) for an example

in our project:

#### errors:

- error-1

```
_flask.cli.NoAppException: While importing "willdel", an ImportError was raised:

Traceback (most recent call last):
  File "/home/srx/Work/tmpDemo/Flask/myproject/venv/lib/python3.6/site-packages/flask/cli.py", line 240, in locate_app_import__(module_name)
  File "/home/srx/Work/tmpDemo/Flask/myproject/venv/willdel.py", line 3, in <module>
    from flask_restplus import Api, Resource
  File "/home/srx/Work/tmpDemo/Flask/myproject/venv/lib/python3.6/site-packages/flask_restplus/__init__.py", line 4, in <module>
    from . import fields, reqparse, apidoc, inputs, cors
  File "/home/srx/Work/tmpDemo/Flask/myproject/venv/lib/python3.6/site-packages/flask_restplus/fields.py", line 17, in <module>
    from werkzeug import cached_property
ImportError: cannot import name 'cached_property_   
```

- solved-1
   as this says:https://github.com/noirbizarre/flask-restplus/issues/777
   Downgrading to Werkzeug to 0.16.0 (temporarily) resolved the issue.
   ** DO: pip install Werkzeug==0.16.0 **

\####the packages installed in host(venv)
 pip install termcolor  # for output colorful text in terminal
 the other things...