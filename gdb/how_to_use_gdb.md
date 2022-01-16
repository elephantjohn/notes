# how to use gdb



## 1. compile with -g , so that we can gdb a executable file

gcc -o main main.c -g

```
#include<stdio.h>

int main(){
	int d = 2;
	printf("Welcome to a program with a bug!\n");
	
	scanf("%d",d);

	printf("You gave me: %d",d);
    return 0;
}
```

we can use:

```
wc -c main
```

to check the bytes counts in main executeable file

## 2. run gdb

gdb ./main

> lay next 

will show the code ui.

```
b main : braek point in main function
ni  : next instrunctions (assembley language)
n  : next code
step : step in the code
```

## 3. how to find core

```
gdb ./main
lay next (options)
break main (breakpoint)
r (run code)
===when segmant fault happes===
x/i $pc (examine instructions the $pc value)
info registers

```



## 4. gdb commands

```
call function
info threads
set var i=3
display var
undisplay var
info display  	//显示所有自动显示的变量或表达式
```

more infos:https://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/gdb.html