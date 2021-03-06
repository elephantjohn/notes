

## 1.1.  Variables  
#### 1.1.1 system variables

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

####  1.1.2. user variables

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

## 



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

### 1.3.5  read default input

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



## 1.4 pass argument to a bash-script

```bash
#!/bin/bash

echo $0 $1 $2 $3  ' > echo $0 $1 $2 $3'

args=("$@")

echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}  
echo ${args[0]} ${args[1]} ${args[2]} ${args[3]}  ${args[4]}  ${args[5]}
echo $@ #echo all the params except [0]
echo $#   #the number of argument pass to the bash
```

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh  7 b8 adf iy
./test.sh 7 b8 adf  > echo $0 $1 $2 $3
7 b8 adf iy
7 b8 adf iy  #same as above,the args[4] and args[5] is not here because not input by the user.
7 b8 adf iy
4
```

## 1.5 If Statement ( If / If-then / If-elif-else)

SEE THE GRAPH BELOW:

WE HAVE interger comparison and string comparising !

![bash-integer-comparison](bash-integer-comparison.png)



### 1.5.1 -eq

```bash
#!/bin/bash

 count=10

if [ $count -eq 10 ]
then
    echo "condition is true"
fi
```

the output is:

```bash
condition is true
```

### 1.5.2 -ne

```bash
#!/bin/bash

 count=10

if [ $count -ne 9 ]
then
    echo "condition is true"
fi
```

the output is:

```bash
condition is true
```

### 1.5.3     >

```bash
#!/bin/bash

 count=10

if [ $count > 9 ]
then
    echo "condition is true"
fi
```

the output is:

```bash
condition is true
```

ETC...

### 1.5.4     == / =

```bash
#!/bin/bash

word=abc

if [ $word == "abc" ]
#if [ $word = "abc" ] # singal = also works

then
    echo "condition is true"
fi
```

the output is:

```bash
condition is true
```

### 1.5.5    <   

compare the ASCII value

the [ ] cant work

```bash
#!/bin/bash

word=abc

if [ $word < "bbc" ]
then
    echo "condition is true"
fi
```

the output is :

```bash
./test.sh: line 5: bbc: No such file or directory
```

BUT [[ ]] works :

```bash
#!/bin/bash

word=abc

if [[ $word < "bbc" ]]
then
    echo "condition is true"
fi
```

the output is:

```bash
condition is true
```



__** TIPS**__:

the [[ ]] means : when campare strings in bash, trans the value in ASCII alphabetical order. so ,when you compare strints and  use "<" , ">" , you use "[[ ]]" ,but when you use "==","=", or "!=", you dont need to use "[[ ]]" , "[ ]" also works. 

### 1.5.6   !=

```bash
#!/bin/bash

word=abc

if [ $word != "bbb" ]  # the [] and [[]] all works
then
    echo "condition  is true"
fi
```

the output is:

```bash
condition  is true
```



### 1.5.7 else / elif

```bash
#!/bin/bash

word=a

if [[ $word = "b" ]]
then
    echo "condition b is true"
elif [[ $word == "a" ]] #has a blank after right "
#elif [[ $word == "a"]]  #error, becaue no blank after right "
then
    echo "condition a is true"
else 
    echo "condition is false"
fi
```

the output is:

```bash
condition a is true
```

### 1.5.8       -z

```bash
#!/bin/bash

word=""

if [ $word -z ]
then
    echo " condition  is true"
fi
```

the output is:

```bash
 condition  is true
```



## 1.6 File test operators

#### 1.6.1   -e (exists)

```bash
#!/bin/bash

echo  -e "Enter the name of file :\c"  # this e means '\' in '\c' will be interpretor rather than echo by a normal string, the '\c' wont make a next line, so user can input the file name in the same bash line.
read file_name

if [ -e $file_name ] #if exist
then
    echo "$file_name found"
else
    echo "$file_name not found"
fi
```

now ,if i touch a agb in current bash script dir, the  output is:

```bash
Enter the name of file :abg
abg found
```



#### 1.6.2  -f (is a regular file)

```bash
#!/bin/bash

echo  -e "Enter the name of file :\c"
read file_name

if [ -f $file_name ] # check if a regular file or not.
then
    echo "$file_name found"
else
    echo "$file_name not found"
fi
```

now if you mkdir a abg_dir, the output is:

```bash
Enter the name of file :abg_dir
abg_dir not found
```



#### 1.6.3    -d (is a directory or not)

```bash
#!/bin/bash

echo  -e "Enter the name of file :\c"
read file_name

if [ -d $file_name ]
then
    echo "$file_name found"
else
    echo "$file_name not found"
fi
```

now if you mkdir a abg_dir, the output is:

```
Enter the name of file :abg_dir
abg_dir not found
```



#### 1.6.4   -b (is a binrary file)

if a jpg,video, it's -b

#### 1.6.5    -c (?)

galleary ?

#### 1.6.6  -s (is not empty)

```bash
#!/bin/bash

echo  -e "Enter the name of file :\c"
read file_name

if [ -s $file_name ]
then
    echo "$file_name is not empty"
else
    echo "$file_name is empty"
fi
```

if the filename is not exist, it's empty. 

if you vim the file as some charators , its not empty

#### 1.6.7     -r / -w / -x  

if the filename has a read /write /execute permission.

```bash
#!/bin/bash

echo  -e "Enter the name of file :\c"
read file_name

if [ -r $file_name ]
then
    echo "$file_name can be read"
else
    echo "$file_name can not be read"
fi
```

if the file has the read permission, the output is :

```bash
Enter the name of file :abg
abg can be read
```



## 1.7 How to append output to the end of text file

```bash
#!/bin/bash

echo  -e "Enter the name of file :\c"
read file_name

if [ -f $file_name ]
then
    if [ -w  $file_name ]
    then
        echo "Type some text data, to quie press ctrl+d"
        cat >>  $file_name   #append
        cat >  $file_name    # over write
    else
        echo "the file do not have write permissions"
    fi
else
    echo "$file_name not exists"
fi
```



## 1.8 Logical 'AND' Operator

```bash
#!/bin/bash


age=25

if [ "$age" -gt  18 ] && [ $age -lt 30 ] # -gt means greater than, -lt means less than
then
    echo " 18 < age <30"
fi
```

the output is:

```bash
 18 < age <30
```



or use '-a'  as  meaning of 'and',use '[ ]' not '[[ ]]'

```bash
#!/bin/bash


age=25

if [ "$age" -gt  18 -a $age -lt 30 ]
then
    echo " 18 < age <30"
fi
```

or use '[[ ]]' and &&

```bash
#!/bin/bash


age=25

if [[ "$age" -gt  18 && $age -lt 30 ]]
then
    echo " 18 < age <30"
fi
```



## 1.9  Logical 'OR' Operator

```bash
#!/bin/bash


age=60

if [ "$age" -gt  18 ] || [ $age -lt 30 ] # -gt means greater than
then
    echo " 18 < age <30"
else
    echo "age not valid"
fi
```

the output is:

```bash
 18 < age <30
```



or, you can use '-o':

```bash
#!/bin/bash


age=60

if [ "$age" -gt  18  -o $age -lt 30 ] # -gt means greater than
then
    echo " 18 < age <30"
else
    echo "age not valid"
fi
```

or ,you can use:

```bash
#!/bin/bash


age=60

if [[ "$age" -gt  18  || $age -lt 30 ]] # -gt means greater than
then
    echo " 18 < age <30"
else
    echo "age not valid"
fi
```



## 1.10  Perform arithmetic operations

```bash
#!/bin/bash

num1=20
num2=5

echo "===000==="
echo $((num1 + num2))
echo $(( num1 + num2 ))
echo 20+5
echo

echo "===aaa==="
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))
echo

echo "===bbb==="
echo $((num1 - num2))
echo $((num1 * num2))
echo $((num1 / num2))
echo $((num1 % num2))
echo

echo "===ccc==="
echo $(expr $num1 + $num2)
echo $(expr $num1 - $num2)
echo $(expr $num1 * $num2)
echo $(expr $num1 \* $num2)
echo $(expr $num1 / $num2)
echo $(expr $num1 % $num2)
```

the output is:

```bash
===000===
25
25
20+5

===aaa===
15
100
4
0

===bbb===
15
100
4
0

===ccc===
25
15
expr: syntax error

100
4
0
```

## 1.11   Float point math operations in bash | bc Command

```bash
#!/bin/bash

num1=20.5
num2=5

echo "20.5+5" | bc
echo "$num1+$num2" | bc
echo "20.5-5" | bc
echo "$num1-$num2" | bc
echo "20.5*5" | bc
echo "20.5/5" | bc
echo "scale=4;20.5/5" | bc
echo "20.5%5" | bc

num=27
echo "scale=2;sqrt($num)" | bc
num=4
echo "scale=2;sqrt($num)" | bc -l
echo "scale=2;3^3" | bc  -l  # man bc ,to see -l (math lib)

```

the output is:

```bash
25.5
25.5
15.5
15.5
102.5
4
4.1000
.5
5.19
2.00
27
```



## 1.12   The case statement

```bash
#! /bin/bash

vehicle=$1

case $vehicle in 
    "car" )
        echo "Rent of $vehicle is 100 dollar" ;;
    "van" )
        echo "Rent of $vehicle is 80 dollar" ;;
    "bicycle" )
        echo "Rent of $vehicle is50 dollar" ;;
    "truck" )
        echo "Rent of $vehicle is 150 dollar" ;;
    * )
        echo "Unkonw vehicle" ;;
esac
```

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
Unkonw vehicle
srx@ipp:~/Work/notes/linux$ ./test.sh car
Rent of car is 100 dollar
srx@ipp:~/Work/notes/linux$ 
```

## 1.13  The case statement Example

```BASH
#! /bin/bash


echo -e "Enter some charector : \c"
read value


case $value in 
    [a-z] )
        echo "User entered $value a to z" ;;
    [A-Z] )
        echo "User entered $value A to Z" ;;
    [0-9] )
        echo "User entered $value 0 to 9" ;;
    ? ) #ANY charator , only one charactor
        echo "User entered $value a special charactor" ;;
    * ) #ANY charator , more than one one charactor
        echo "Unkonw input" ;;
esac
```

the output is:

```
srx@ipp:~/Work/notes/linux$ ./test.sh K
Enter some charector : K
User entered K a to z

srx@ipp:~/Work/notes/linux$ LANG=c
srx@ipp:~/Work/notes/linux$ ./test.sh 
Enter some charector : k
User entered k A to Z

#the "LANG" environment variable indicates the language/local and coding, where "C" is the language setting




srx@ipp:~/Work/notes/linux$ ./test.sh 
Enter some charector : &
User entered & a special charactor

srx@ipp:~/Work/notes/linux$ ./test.sh 
Enter some charector : ahsdkfhas
Unkonw input
```





##  1.14   Array variables

```bash
#! /bin/bash

os=('ubuntu' 'windows' 'kali')
os[3]='mac'
echo "${os[@]}"
echo "${os[1]}"
echo "${!os[@]}"
echo "${#os[@]}"
echo 

os[0]='mac'
echo "${os[@]}"
echo 

unset os[2] #remove element 'kali'
echo "${os[@]}"
echo 

os[6]='pi'
echo "${!os[@]}"
echo "${os[@]}"
echo "${#os[@]}"
echo

string=dasasdfkhahd
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}"
echo "the above line  of string[1] is empty"
echo "${#string[@]}"
```

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
ubuntu windows kali mac
windows
0 1 2 3
4

mac windows kali mac

mac windows mac

0 1 3 6
mac windows mac pi
4

dasasdfkhahd
dasasdfkhahd

the above line  of string[1] is empty
1
```



##  1.15  WHILE  loops

```bash
#! /bin/bash

n=1

#while [ $n -le 10 ] #less or equal to 10
while (($n <= 10))  # the same as above
do 
    echo "$n"
    n=$((n+1))  
   # ((n++))  # the same as above
   # ((++n))  # the same as above
done
```

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
1
2
3
4
5
6
7
8
9
10
```





##  1.16 Using sleep and  open terminal with WHILE loops

#### 1.16.1 example 1

```BASH
#! /bin/bash

n=1

while [ $n -le 10 ] #less or equal to 10
do 
    echo "$n"
    ((n++))  # the same as above
    sleep 1 # sleep 1 seconds
done
```

the output is:

```
srx@ipp:~/Work/notes/linux$ ./test.sh 
1
2
3
4
5
6
7
8
9
10
```

#### 1.16.2  example 2

```bash
#! /bin/bash

n=1

while [ $n -le 3 ] #less or equal to 10
do 
    echo "$n"
    ((n++))  # the same as above
    gnome-terminal &  # open a terminal
done
```

the output is:

3 terminal windows were opened.



##  1.17  Read a file content in Bash

#### 1.17.1  example1

we have a file named test.sh,the content is as below:

MAKE THE MOUSE POINTER TO NEXT EMPTY LINE!!! OR THE LAST LINE WONT SHOW.

```bash
#! /bin/bash

while read p 
do
    echo $p 
done < test.sh  # read from file "test.sh"
                # here is an empty line
```

then run the bash, the output is:

```
srx@ipp:~/Work/notes/linux$ ./test.sh 
#! /bin/bash

while read p
do
echo $p
done < test.sh # read from file "test.sh"
# here is an empty line
```

#### 1.17.2  example 2

MAKE THE MOUSE POINTER TO NEXT EMPTY LINE!!! OR THE LAST LINE WONT SHOW.

```bash
#! /bin/bash

cat test.sh | while read p 
do
    echo $p 
done 
                # here is an empty line
```

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
#! /bin/bash

cat test.sh | while read p
do
echo $p
done
# here is an empty line
```

####  1.17.3 example 3  using IFS

```bash
#! /bin/bash

while IFS= read -r p
do
    echo $p
done < test.sh
         # here is an empty line
```

the output is:

```BASH
srx@ipp:~/Work/notes/linux$ ./test.sh 
#! /bin/bash

while IFS= read -r p
do
echo $p
done < test.sh
# here is an empty line
```



##  1.18  UNTIL loop

```bash
#! /bin/bash

n=1
until [ $n -gt 10 ]
do
    echo $n
    n=$((n+1))
    # ((++n))  #the same as above
done
```

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
1
2
3
4
5
6
7
8
9
10
```



## 1.19   For loop

#### 1.19.1  ex1

```bash
#! /bin/bash

for i in 1 2 3 4 5 
# for i in {1..5}  the same as above
# for i in {1..10..2} #{star..end..interval} : 1 3 5 7 9
do
    echo $i
done
```

the output:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
1
2
3
4
5
```

#### 1.19.2  ex2

````bash
#! /bin/bash

echo ${BASH_VERSION}
for i in {1..10..2} #{star..end..interval}
do
    echo $i
done
````

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
4.4.20(1)-release
1
3
5
```

#### 1.19.3   ex3

```baSh
#! /bin/bash

echo ${BASH_VERSION}
for ((i=0;i<5;i++))
do
    echo $i
done
```

the output is:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
4.4.20(1)-release
0
1
2
3
4
```

## 1.20  use FOR Loop to execute commands

#### 1.20.1  ex1 

```bash
#! /bin/bash

for command in ls pwd date
do
    echo "-----------$command-----------" # give the name of command
    $command  # execute the command
done
```

the output:

```
srx@ipp:~/Work/notes/linux$ ./test.sh 
-----------ls-----------
abg   bash-integer-comparison.png  bash.skills.md        
abgg  bash.scripting.skills.md     test.sh
-----------pwd-----------
/home/srx/Work/notes/linux
-----------date-----------
Sun Aug 16 21:11:11 CST 2020
```

#### 1.20.2   ex2

```bash
#! /bin/bash

for item in *  # in current directory
do
    if [ -d $item ]  # if is a directory
    then
        echo $item  # peint the name of the directory
    fi 
done
```

the output:

```bash
dir1 dir2 dir3
```



## 1.21  Select loop

#### 1.21.1  ex1

```bash
#! /bin/bash

select varName in mark john tom ben
do
    echo "$varName selected"
done
```

the output :

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
1) mark
2) john
3) tom
4) ben
#? 2
john selected
#? 3
tom selected
#? 4
ben selected
#? 7
 selected
```

####  1.21.2 ex2

```bash
#! /bin/bash

select varName in mark john tom ben
do
    case $varName in 
    mark)
        echo mark selected
        ;;
    john)
        echo john selected
        ;;
    tom)
        echo tom selected
        ;;
    ben)
        echo ben selected
        ;;
    *)
        echo "Error,please provide the no. between 1..4"
    esac
done
```

the output:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
1) mark
2) john
3) tom
4) ben
#? 8
Error,please provide the no. between 1..4
#? 2
john selected
#? 
```



## 1.22   Break and continue

```bash
#! /bin/bash

for ((i=1;i<=10;i++))
do
    if [ $i -eq 3 -o $i -eq 6 ]
    then
        continue # will continue the loop
        #break   # will break the loop
    fi
    echo "$i"
done
```

the output :

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
1
2
4
5
7
8
9
10 
```



## 1.23  Functions

```bash
#! /bin/bash

function print(){
    echo $1 $2 $3
}

quit(){
    exit
}

print Hello  World   Again
 

echo "foo"
quit
```

the output:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
Hello World Again
foo
```

## 1.24  Local variables

```bash
#! /bin/bash

function print(){
    #name=$1        #outside will change too
    local name=$1   #outside variable wont change
    echo "the name is $name"
}

name="Tom"

echo "the name is $name before"

print Max 

echo "the name is $name  after"

```

the output:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
the name is Tom before
the name is Max
the name is Tom  after
```



## 1.25   Function example

```bash
#! /bin/bash

usage(){
    echo "you need to provide an argument : "
    echo "usage : $0  file_name"
} 

is_file_exist(){
    local file="$1"  # $1 is the first function trans from the caller
    [[ -f "$file" ]] && return 0 || return 1
} 

[[ $# -eq 0  ]] && usage

if (is_file_exist "$1")  # $1 is the first function trans from the bash
then
    echo "File found"
else
    echo "File not found"
fi
```

the output:

```bASH
srx@ipp:~/Work/notes/linux$ ./test.sh abg
File found
srx@ipp:~/Work/notes/linux$ ./test.sh abgg
File not found
```

##  1.26  Readonly command

```bash
#! /bin/bash

var=31

readonly var

var=50

echo "var ==> $var"

hello(){
    echo "Hello World"
}

readonly -f hello  # -f function

hello(){
    echo "Hello World a"  # modify a readonly function
}

readonly -f  # give all the readonly functions

```

the output:

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
./test.sh: line 7: var: readonly variable
var ==> 31
./test.sh: line 19: hello: readonly function
hello () 
{ 
    echo "Hello World"
}
declare -fr hello
srx@ipp:~/Work/notes
```



## 1.27    Signals and Traps



#### 1.27.1 signals

use the command to check signals

```bash
srx@ipp:~/Work/notes/linux$  man 7 signal 


xxxx
 Signal     Value     Action   Comment
       ----------------------------------------------------------------------
       SIGHUP        1       Term    Hangup detected on controlling terminal
                                     or death of controlling process
       SIGINT        2       Term    Interrupt from keyboard
       SIGQUIT       3       Core    Quit from keyboard
       SIGILL        4       Core    Illegal Instruction
       SIGABRT       6       Core    Abort signal from abort(3)
       SIGFPE        8       Core    Floating-point exception
       SIGKILL       9       Term    Kill signal

       SIGSEGV      11       Core    Invalid memory reference
       SIGPIPE      13       Term    Broken pipe: write to pipe with no
                                     readers; see pipe(7)
       SIGALRM      14       Term    Timer signal from alarm(2)
       SIGTERM      15       Term    Termination signal
       SIGUSR1   30,10,16    Term    User-defined signal 1
       SIGUSR2   31,12,17    Term    User-defined signal 2
       SIGCHLD   20,17,18    Ign     Child stopped or terminated
       SIGCONT   19,18,25    Cont    Continue if stopped
       SIGSTOP   17,19,23    Stop    Stop process
       SIGTSTP   18,20,24    Stop    Stop typed at terminal
       SIGTTIN   21,21,26    Stop    Terminal input for background process
       SIGTTOU   22,22,27    Stop    Terminal output for background process
---------------------------------------------
kill -9 xxxx
ctrl+c
ctrl+z
```

#### 1..27.2  traps



###### 1.27.2.1  ex1

```bash
#! /bin/bash

trap "echo EXIT command is detected" 0  # if signal 0 occured, then the trap run 

echo "Hello world"

exit 0
```

the output :

```
srx@ipp:~/Work/notes/linux$ ./test.sh 
Hello world
EXIT command is detected
```

###### 1.27.2.2 

```bash
#! /bin/bash

trap "echo EXIT command is detected" SIGINT  # if signal ctrl+c occured, then the trap run 

echo "pid is $$"

while((COUNT < 10))
do
    sleep 10
    ((COUNT++))
    echo $COUNT
done

exit 0
```

the output :

```bash
srx@ipp:~/Work/notes/linux$ ./test.sh 
pid is 16666
^CEXIT command is detected
1
^CEXIT command is detected
2
^CEXIT command is detected
3
^CEXIT command is detected
4
^CEXIT command is detected
5
6
^CEXIT command is detected
7
^CEXIT command is detected
8
9
10
```

###### 1.27.2.3     ex3

```bash
#! /bin/bash

file=/home/srx/Work/notes/linux/willdel.txt
trap "rm -f $file; exit" 0 2 15  # if signa 0, 2, or 15 occurd,run the command
echo "pid is $$"

while((COUNT < 10))
do
    sleep 10
    ((COUNT++))
    echo $COUNT
done

exit 0
```

if kill -15 xxxx, the file "willdel.txt" will be delete.

## 1.28   How to debug a bash script

#### 1.28.1  use option  -x in terminal

````bash
srx@ipp:~/Work/notes/linux$ bash -x ./test.sh 
+ file=/home/srx/Work/notes/linux/willdel.txt
+ trap detected 0 2 15
+ echo 'pid is 17079'
pid is 17079
+ (( COUNT < 10 ))
+ sleep 10
````

#### 1.28.2  use option -x in script

```bash
#! /bin/bash  -x
file=/home/srx/Work/notes/linux/willdel.txt
trap "detected" 0 2 15  # if signa 0, 2, or 15 occurd,run the command
echo "pid is $$"

while((COUNT < 10))
do
    sleep 10
    ((COUNT++))
    echo $COUNT
done

exit 0
```

#### 1.28.3 use "set -x/+x " option in script

```

```

