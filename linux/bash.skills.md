## bash skills

### kill all process by name
ps -ef | grep -i mimicTopicPub_faces.sh | awk {'print $2'} | xargs kill -9

### write a for loop

```bash
#!/bin/bash

for i in {1..100}
do
   bash mimicTopicPub_faces.sh &
done
```

### list files by size

```bash
 ls -lSrh | tail -7
```

### list counts

```
ls | wc -l
```

### check disk info

```bash
sudo fdisk -l
```



