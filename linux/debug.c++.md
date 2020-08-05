## debug in c++ program

use :

```
make -d  VERBOSE=1  > a.txt
```

see the content in a.txt.

find the error place in a.txt, and then copy the /bin/c++ -I*.o ... ... ...

modify it as (delte -o when needed) :

```
g++ -E XXX 
```

for ex:

```
g++   -DLANDMARKS -D_CPU_ONLY_ -D_USE_SSL_ -I/home/ubuntu/Work -I/home/ubuntu/Work/isz/szface_api/src -I/home/ubuntu/ -I/usr/local/cuda/include -isystem /usr/local/include/opencv4  -g -O3 -std=c++11 -pthread -fopenmp   -E /home/ubuntu  > A.txt
```