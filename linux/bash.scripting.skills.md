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





