```python
# get all files in a nested dir , write the file path to a file named xxx-txt;
# the dir can be nested a very deep level
# how to use the .py:
### python get.all.filenames.in.nest.dirs.py /path/to/any/dir 
### then a file named /path/to/any/dir-txt will generated, and all the files info in "/path/to/any/dir " will be listed in it.

import os
import sys
from os import getcwd


filepath= sys.argv[1]


txtname=filepath[0:len(filepath)]
filelist=os.listdir(filepath)
abpath=open('%s-txt'%txtname,'w+')


def write_path_to_file(path):
    if os.path.isdir(path):
        filelist=os.listdir(path)
        for filename in filelist:
            if os.path.isdir(path  + "/" + filename):
                write_path_to_file(path + "/"  + filename)
            else :
                print("path+filename =" + path  + "==" + filename)

                write_path_to_file(path +"/" + filename)
                abpath.write('%s/%s\n'%(path,filename)) 

for filename in filelist:
    write_path_to_file(filepath+"/" + filename)   

abpath.close()
```

