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



## googletest frame

after link, the object files can generate executive file , __OR__ static link file(*.a).

main.cpp:

```c++
// main.cpp

#include <iostream>

#include <gtest/gtest.h>

using namespace std;

TEST(test,add1){
	EXPECT_EQ(add(3,4),7);
    EXPECT_NE(add(3,4),6);
	EXPECT_LT(add(3,4),8);
	EXPECT_LE(add(3,4),7);
	EXPECT_GT(add(3,4),6);
	EXPECT_GE(add(3,4),7);
}

TEST(test,add1){
	EXPECT_EQ(add(3,4),7);
    EXPECT_NE(add(3,4),7);
	EXPECT_LT(add(3,4),8);
	EXPECT_LE(add(3,4),7);
	EXPECT_GT(add(3,4),6);
	EXPECT_GE(add(3,4),7);
}


int main()
{
	printf("add(3,4) = %d\n",add(3,4));   // add this line
	return RUN_ALL_TESTS();
}
```

build :

```bash
$ g++ -c main.cpp 
main.cpp:3:10: fatal error: gtest/gtest.h: No such file or directory
    3 | #include <gtest/gtest.h>
      |          ^~~~~~~~~~~~~~~
compilation terminated.
```

so ,add the "I" options to find the include directory;

```bash
$ g++ -I/home/ipp/Work/supporters/googletest/googletest/include -c main.cpp
```

then main.o generated.

then link the main.o:

```bash
$ g++ main.o
```

the output is :

```bash
/usr/bin/ld: main.o:(.data.rel.ro._ZTV14test_add2_Test[_ZTV14test_add2_Test]+0x20): undefined reference to `testing::Test::SetUp()'
/usr/bin/ld: main.o:(.data.rel.ro._ZTV14test_add2_Test[_ZTV14test_add2_Test]+0x28): undefined reference to `testing::Test::TearDown()'
/usr/bin/ld: main.o: in function `test_add2_Test::~test_add2_Test()':
main.cpp:(.text._ZN14test_add2_TestD2Ev[_ZN14test_add2_TestD5Ev]+0x26): undefined reference to `testing::Test::~Test()'
/usr/bin/ld: main.o:(.data.rel.ro._ZTV14test_add1_Test[_ZTV14test_add1_Test]+0x20): undefined reference to `testing::Test::SetUp()'
/usr/bin/ld: main.o:(.data.rel.ro._ZTV14test_add1_Test[_ZTV14test_add1_Test]+0x28): undefined reference to `testing::Test::TearDown()'
/usr/bin/ld: main.o: in function `test_add1_Test::~test_add1_Test()':
main.cpp:(.text._ZN14test_add1_TestD2Ev[_ZN14test_add1_TestD5Ev]+0x26): undefined reference to `testing::Test::~Test()'
/usr/bin/ld: main.o:(.data.rel.ro._ZTI14test_add2_Test[_ZTI14test_add2_Test]+0x10): undefined reference to `typeinfo for testing::Test'
/usr/bin/ld: main.o:(.data.rel.ro._ZTI14test_add1_Test[_ZTI14test_add1_Test]+0x10): undefined reference to `typeinfo for testing::Test'
/usr/bin/ld: main.o: in function `test_add2_Test::test_add2_Test()':
main.cpp:(.text._ZN14test_add2_TestC2Ev[_ZN14test_add2_TestC5Ev]+0x18): undefined reference to `testing::Test::Test()'
/usr/bin/ld: main.o: in function `test_add1_Test::test_add1_Test()':
main.cpp:(.text._ZN14test_add1_TestC2Ev[_ZN14test_add1_TestC5Ev]+0x18): undefined reference to `testing::Test::Test()'
collect2: error: ld returned 1 exit status
...
...
...
```

then add the lib source as below:

```bash
$ g++ -L/home/ipp/Work/supporters/googletest/build/lib main.o -lgtest -lpthread
```

## Colorful printf function

__config__:

```bash
\033[A1;A2;A3;...AN m
```

![config](./color.printf.config.png)

__EXAMPLE 1:__

mian.cpp:

```c++
// main.cpp

#include <iostream>

int main()
{
	printf("\033[1;31;40mhello world\n");
	printf("\033[1;31;42mhello world\033[0m\n");//"\033[0m" close the color mode
	printf(" this line won't change color\n");
		
	return 0;
}
```

we can write a Makefile to build the cpp:

Makefile:

```cmake
all:
	g++ -std=c++11  main.cpp
```

then we run make:

```bash

$ make
```

the output is:

![output](./color.printf.config.close.mode.png)



__EXAMPLE 2:__

main.cpp:

```c++
#include <iostream>

int main()
{
	printf("\033[0;1;31;40mhello world\n");//"0" to clear setting before
	printf("\033[0;34mhello world\n");//"only overwrite 34 color, the other color are default"
	printf("\033[0;35mhello\n");
	printf(" this line will change color although no color setting in this line\n");
	printf("\033[0;36mhello\033[0m\n");
	printf(" this line won't change color because color mode close in the end of last line\n");	
	return 0;
}
```



the output is:

![output2](./color.printf.config.close.mode.2.png)