rotate image

```bash
for szFile in /home/srx/bin/wangxuan/photo_wangxuan/*.jpg
do 
    convert "$szFile" -rotate 90 /home/srx/tmp/"$(basename "$szFile")" ; 
done
```

