#  books to read

<<C++对象模型>>

# compile and link

编译：语法检查

链接：各符号，定义的链接，查找

## nm 

```
nm -C xxx.o

U menas outside to look for defination
[numbers] T means the function defination is in the .o file 
```



## errors

### 1. undefinded 

the below two lines are the same:

>  undefined reference to 'xxx' (in linux os)

> undefined symbols for architecture x86_64 (in mac os)

the error in happend in link stage.



__EXAMPLE:__

```C++
// main.cpp
#include <iostream>

using namespace std;

int add(int a,int b);

int main()
{
	printf("the add result %d\n",add(3,4));
	return 0;
}

```

then we build it:

```bash
g++ -c main.cpp 
```

a main.o will generated. and no errror occur.

then we do link:

```
g++ main.o
```

the error  occur:

```bash
$ g++ main.o
/usr/bin/ld: main.o: in function `main':
main.cpp:(.text+0x13): undefined reference to `add(int, int)'
collect2: error: ld returned 1 exit status
```

the link faiked .

__CONCLUSION OF THE EXAMPLE__:

the code can build successful, but will failed when link.

__CHECK *.o file__:

```bash
nm -C main.o
```

the output is:

```bash
                 U __cxa_atexit
                 U __dso_handle
                 U _GLOBAL_OFFSET_TABLE_
000000000000007e t _GLOBAL__sub_I_main
0000000000000000 T main
                 U printf
                 U add(int, int)
0000000000000031 t __static_initialization_and_destruction_0(int, int)
                 U std::ios_base::Init::Init()
                 U std::ios_base::Init::~Init()
0000000000000000 r std::piecewise_construct
0000000000000000 b std::__ioinit
```

the "T" aftet the numbers such as "00000000000" means the function defination is in the file, so the compiler dont need to look for the defination of the function outside. but the "U" means the compiler need to look for the function outside.

__SOLVE THE PROBLEM of the EXAMPLE__:

add a file named other.cc:

```c++
// other.cc

int add(int a,int b)
{
	return a+b;
}
```

and then:

```c++
g++ -c other.cc
```

now , a other.o generated,

we can check other.o and main.o:

"nm -C main.o":

```
                 U __cxa_atexit
                 U __dso_handle
                 U _GLOBAL_OFFSET_TABLE_
000000000000007e t _GLOBAL__sub_I_main
0000000000000000 T main
                 U printf
                 U add(int, int)
0000000000000031 t __static_initialization_and_destruction_0(int, int)
                 U std::ios_base::Init::Init()
                 U std::ios_base::Init::~Init()
0000000000000000 r std::piecewise_construct
0000000000000000 b std::__ioinit
```



"nm -C other.o":

```
0000000000000000 T add(int, int)
```

so , the two object files can match, because the funciton "add" is "U" in main.o but "T" in other.o , so link is successful.

### 2. multiple definition

the below two lines are the same:

> multiple definition of 'xxx'  (linux)

> duplicate symbol for architecture x86_64 (mac)

the error happend when define one function in two *.o , so when link them togther, the error occures. 



__EXAMPLE:__

main.cpp :

```c++
// main.cpp

#include <iostream>

using namespace std;

int add(int a,int b)
{
	return a+b;
}

int main()
{
	printf("the add result %d\n",add(3,4));
	return 0;
}

```

other.cpp

```c++
// other.cc
int add(int a,int b)
{
	return a+b;
}
```



build them to obj files:

```bash
$ g++ -c main.cpp
$ g++ -c other.cc
```

link them:

```bash
$ g++ main.o other.o
```

```
/usr/bin/ld: other.o: in function `add(int, int)':
other.cc:(.text+0x0): multiple definition of `add(int, int)'; main.o:main.cpp:(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
```

why failed, because the func "add" defined in two obj files.

### multidefination by *.h

add a other.h file:

```c++
#ifndef _OTHER_H
#define _OTHER_H

int add(int,int);

int f(int x){
	return x;
}

#endif
```

modify the main.cpp as  below:

```c++
#include <iostream>

#include "other.h" //add this line

using namespace std;


int main()
{
	printf("f(6) = %d\n",f(6));   // add this line
	printf("the add result %d\n",add(3,4));// %d helps the compiler to check syntax
	return 0;
}
```

modify the other.cc:

```c++
#include "other.h"

int add(int a,int b)
{  
	f(123);
	return a+b;
}
```

build them to obj files:

```bash
$ g++ -c main.cpp
$ g++ -c other.cc
```

link them:

```bash
$ g++ main.o other.o
```

```bash
/usr/bin/ld: other.o: in function `f(int)':
other.cc:(.text+0x0): multiple definition of `f(int)'; main.o:main.cpp:(.text+0x0): first defined here
collect2: error: ld returned 1 exit status
```

__CONCLUSTION OF the EXAMPLE:__

```
dont defination functions in .h file
```

