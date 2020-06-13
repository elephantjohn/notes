10 python tips and tricks for writing better code

# 1. condition

#### eg-1

```python
condition = True

if condition:
    x = 1
else:
    x = 0

print (x)
```

a better code for eg-1:

```python
condition = True

x = 1 if condition else 0

print (x)
```



# 2. numbers

#### eg-2.1

```python
num1 = 100000000000
num2 = 1000000000

total = num1 + num2

print (total)
```

a better code :

```python
num1 = 100_000_000_000
num2 = 1_000_000_000

total = num1 + num2

print (total)
```

it's better ,cuz it's easier to read and compare the numbers.  

#### eg-2.2

format a number.

```python
num3 = 100000000000
num4 = 1_000_000_000

print(f'{num3:,}')
print(f'{num4:,}')
```

the output is:

```bash
100,000,000,000
1,000,000,000
```



# 3. file 

#### eg-3

```python
f = open('test.txt','r')

file_contents = f.read()

f.close()

words = file_contents.split(' ')
word_count = len(words)
print(word_count)
```

a better code is:

```python
with open('test.txt','r') as f:
    file_contents = f.read()

words = file_contents.split(' ')
word_count = len(words)
print(word_count)
```

this will make the "content manager" to manage the file,it's easier to write and looks more simpler.



# 4. loop 

#### eg-4.1

```python
names = ['Corey','Chris','Dave','Travis']

index = 0
for name in names:
    print(index,name)
    index += 1
```

 a better code is:

```python
names = ['Corey','Chris','Dave','Travis']

index = 0
for index,name in enumerate(names):
    print(index,name)
```

the outpus is:

```
0 Corey
1 Chris
2 Dave
3 Travis
```

#### eg-4.2

if you want to start at a specific index:

```python
names = ['Corey','Chris','Dave','Travis']

index = 0
for index,name in enumerate(names,start=1):
    print(index,name)
```

the output is:

```
1 Corey
2 Chris
3 Dave
4 Travis
```

# zip

zip means loop two lists as one.

#### eg-5.1 

```python
names  = ['Peter Parker','Clark Kent','Wade Wilson','Bruce Wayne']
heroes = ['Spiderman','Superman','Deadpool','Batman']

for index,name in enumerate(names):
    hero = heroes[index]
    print(f'{name} is actually {hero}')
```

the output is:

```
Peter Parker is actually Spiderman
Clark Kent is actually Superman
Wade Wilson is actually Deadpool
Bruce Wayne is actually Batman
```

a better code is:

```python
names  = ['Peter Parker','Clark Kent','Wade Wilson','Bruce Wayne']
heroes = ['Spiderman','Superman','Deadpool','Batman']

for name,hero in zip(names,heroes):
    print(f'{name} is actually {hero}')
```

#### eg-5.2

if loop three lists to one:

```python
names  = ['Peter Parker','Clark Kent','Wade Wilson','Bruce Wayne']
heroes = ['Spiderman','Superman','Deadpool','Batman']
universes = ['Marvel','DC','Marvel','DC']
for name,hero,universe in zip(names,heroes,universes):
    print(f'{name} is actually {hero} from {universe}')
```

the output is:

```
Peter Parker is actually Spiderman from Marvel
Clark Kent is actually Superman from DC
Wade Wilson is actually Deadpool from Marvel
Bruce Wayne is actually Batman from DC
```

#### eg-5.3

print the zip instead access each element:

```python
names  = ['Peter Parker','Clark Kent','Wade Wilson','Bruce Wayne']
heroes = ['Spiderman','Superman','Deadpool','Batman']
universes = ['Marvel','DC','Marvel','DC']
for value in zip(names,heroes,universes):
    print(value)
```

the output is:

```
'Peter Parker', 'Spiderman', 'Marvel')
('Clark Kent', 'Superman', 'DC')
('Wade Wilson', 'Deadpool', 'Marvel')
('Bruce Wayne', 'Batman', 'DC')
```

####  eg-5.4

the same as eg-5.3:

```python
names  = ['Peter Parker','Clark Kent','Wade Wilson','Bruce Wayne']
heroes = ['Spiderman','Superman','Deadpool','Batman']
universes = ['Marvel','DC','Marvel','DC']
for value in zip(names,heroes,universes):
    print(value)
    print(value[0])
    print(value[1])
    print(value[2])
```

the output is:

```
('Peter Parker', 'Spiderman', 'Marvel')
Peter Parker
Spiderman
Marvel
('Clark Kent', 'Superman', 'DC')
Clark Kent
Superman
DC
('Wade Wilson', 'Deadpool', 'Marvel')
Wade Wilson
Deadpool
Marvel
('Bruce Wayne', 'Batman', 'DC')
Bruce Wayne
Batman
DC
```



# 6. packing/unpacking

#### eg-6.1

```python
a, b = (1, 2)

print(a)
print(b)
```

the output is :

```
1
2
```

#### eg-6.2

if you just want variable "a" and you dont want "b",so we can make "b" unuse by underline:

```python
a, _ = (1, 2)

print(a)
#print(b)
```

#### eg-6.3.1

```python
a, b, *c = (1, 2, 3, 4, 5)

print(a)
print(b)
print(c)
```

the output is:

```
1
2
[3, 4, 5]
```

the "*c" means everything after a and b.

#### eg-6.3.2

```python
a, b, *_ = (1, 2, 3, 4, 5)

print(a)
print(b)
#print(c)
```

 the output is:

```
1
2
```

the symbol "_" makes the value unuse.

#### eg-6.3.3

```python
a, b, *c, d = (1, 2, 3, 4, 5, 6, 7)

print(a)
print(b)
print(c)
print(d)
```

the output is:

```
1
2
[3, 4, 5, 6]
7
```

#### eg-6.3.4

```python
a, b, *_, d = (1, 2, 3, 4, 5, 6, 7)

print(a)
print(b)
#print(c)
print(d)
```

the output is:

```
1
2
7
```



# 7. get/set attributes for object

#### eg-7.1

```python
class Person():
    pass

person = Person()

person.first = "Corey"
person.last  = "Schafer"

print(person.first)
print(person.last)
```

the output is :

```
Corey
Schafer
```

if we use setattr/getattr method:

```python
class Person():
    pass

person = Person()

first_key = 'first'
first_val = 'Corey'

setattr(person, first_key, first_val)

first = getattr(person, first_key)

print(first)
```

the output is :

```
Corey
```

#### eg-7.2

if more key-values,loop them:

```python
class Person():
    pass

person = Person()

person_info = {'first':'Corey','last':'Schafer','age':'35','number':'13883887654','address':'beijing'}

for key,value in person_info.items():
    setattr(person, key, value)

for key in person_info.keys():
    print(getattr(person, key))

```

the output is :

```
Corey
Schafer
35
13883887654
beijing
```

# 8. input secret information

#### eg-8

```python
username = input('please input Username: ')
password = input('please input Password: ')

print('Logging In...')
```

when you run it and input the password, the passwrod is plaintext:

```
please input Username: vimmer
please input Password: mypassword
```

a better code is:

```python
from getpass import getpass

username = input('please input Username: ')
password = getpass('please input Password: ')

print('Logging In...')
```

this time, the password will not be a plaintext.



# 9.  env

python -m venv myvenv



# 10. module

the command :

```bash
python test.py
```

is equal to:

```bash
python -m test
```

"-m" means module name.

#### eg-10.1

```bash
python -m smtpd -c DebuggingServer -n localhost:1025
```

how we know "-c" or "-n" options?

use python terminal to get help,like these commands:

```bash
user@ipp:~/home/$ python
Python 3.6.9 (default, Apr 18 2020, 01:56:04) 
[GCC 8.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>> import smtpd
>> help(smtpd)
```

then a manu page will show in the terminal,you can see "-c" or "-n" options and explaintions.

#### eg-10.2

antother example:

```bash
user@ipp:~/home/$ python
Python 3.6.9 (default, Apr 18 2020, 01:56:04) 
[GCC 8.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from datatime import datetime
>>> dir(datetime)
>>> datetime.today
>>> exit()
```



















