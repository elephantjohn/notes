```python
#!/usr/bin/env python2
# -*- coding: utf-8 -*-
import requests

# xml = """<?xml version='1.0' encoding='utf-8'?>
# <a>б</a>"""

xml = """<?xml version="1.0" encoding="UTF-8"?>
<TX>
	<TX_HEADER>
		<SYS_PKG_VRSN>01</SYS_PKG_VRSN>
		<SYS_TX_CODE>FACEPOC01</SYS_TX_CODE> <!--服务名-->
		<SYS_EVT_TRACE_ID>20170311000001</SYS_EVT_TRACE_ID>
		<SYS_REQ_TIME>20161220162730999</SYS_REQ_TIME>
		<SYS_PKG_STS_TYPE>00</SYS_PKG_STS_TYPE>
	</TX_HEADER>
	<TX_BODY>
        <ENTITY>
        	<MANUF_ID>OBGZ_FACE</MANUF_ID> <!--算法厂商名称-->
    		<GROUPNAME>001</GROUPNAME> <!--人脸库名称-->
    	</ENTITY>
    </TX_BODY>
</TX>"""
headers = {'Content-Type': 'application/xml'} # set what your server accepts
r = requests.post('http://172.16.42.10:8092/ccbfaceServer/facepoc', data=xml.encode('utf-8'), headers=headers)
print(r.content)
```