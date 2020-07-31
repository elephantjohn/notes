# 1. Variables

## 1.1. system variables

```bash
#!/bin/bash
echo our shell name is $BASH
echo our shell version is $BASH_VERSION
echo our home directory is $HOME
echo our current working directory is $PWD
```

result:

```bash
#!/bin/bash

our shell name is /bin/bash
our shell version is 4.4.20(1)-release
our home directory is /home/srx
our current working directory is /home/srx/Work/notes/linux
```

## 1.2. user variables

```bash
#!/bin/bash

name=Mark
val=10
echo the name is $name
echo value is $val
```

result is :

```bash
the name is Mark
value is 10
```

__PAY ATTENTION__

dont add blank around "=", or it will failed, for ex:

```bash
#! /bin/bash

name = Mark #has blank,error!
val = 10    #has blank,error!
name=Mark   #no  blank,OK!
val=10      #no  blank,OK!
```



## 1.3 Read User Input

### 1.3.1 read one input

```bash
#!/bin/bash

echo "Enter name : "
read name
echo "Entered name: $name"
```

the output is:

```bash
Enter name : 
hala
Entered name: hala
```

### 1.3.2  read multi params

```bash
#!/bin/bash

echo Enter name : 
read name1 name2 name3
echo "Names: $name1 , $name2, $name3"
echo Names: $name1 , $name2, $name3
```

the output is:

```bash
Enter name :
a b c
Names: a , b, c
Names: a , b, c
```

### 1.3.3  read -p/-sp  for not change line and passwod

```bash
#!/bin/bash

read -p 'usrname : ' usr_name
read -sp 'pwd : ' usr_pwd
echo
echo 'usrname : ' $usr_name
echo 'pwd : ' $usr_pwd

```

the output is:

```
usrname : sonder  #wont change a new line to input username
pwd :                #can input but cant be seen
usrname :  sonder
pwd :  123235465

```

### 1.3.4  read all inputs

```bash
#!/bin/bash

echo "Enter names : "
read -a names
echo "Names:" ${names[0]},${names[1]}
echo "Names: ${names[0]},${names[1]}"
```

the output is:

````
Enter names : 
tom jonh tix
Names: tom,jonh
Names: tom,jonh
Names: ${names[0]},${names[1]}
````

### 1.4.5  read default input

```echo
#!/bin/bash

echo "Enter names : "
read 
echo "Name:" $REPLY #only '$REPLY' works
```

the output is:

```bash
Enter names : 
AHSDKFLHA
Name: AHSDKFLHA
```



## 1.4 

