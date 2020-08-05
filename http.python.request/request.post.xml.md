```python
#!/usr/bin/env python2
# -*- coding: utf-8 -*-
import requests

headers = {'Content-Type': 'application/xml'} # set what your server accepts


f = open('poc11.xml','r')
file_contents = f.read()

r = requests.post('http://httpbin.org/post', data=file_contents.encode('utf-8'), headers=headers)
print(r.content)
```