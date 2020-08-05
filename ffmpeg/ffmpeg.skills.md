ffmpeg

# split video

```
    ffmpeg -ss 00:00:05 -t 6 -i input.mov -vcodec copy -acodec copy output.mov
```

# loop video

```
ffmpeg -i input.mp4 -c copy output.mkv
ffmpeg -stream_loop 4 -i output.mkv -c copy output.mp4
```

# cut video

```
ffmpeg -i input.mp4 -ss 00:00:00 -to 00:10:10 -c copy output.mp4
```

> **-i**: It stands for the input video file. Here is the input.mp4 behind it.
>
> **input.mp4**: It means the input video file, which is called and named as you wish.
>
> **-ss**: It defines the start of the section that you want to trim.
>
> **00:01:40**: This concrete point (start time) can be sought from the input file.
>
> **-to**: It's the end of the section that you want to trim.
>
> **00:02:16**: This specific point (end time) can be sought from the input file.
>
> **-c copy**: This is an option meaning trimming video via stream copy, which is fast and will not re-encode video.
>
> **output.mp4**: It's the name of your output file and you can name it as desire.
>
> Note: You can see "-t" also from what someone else  show. It means the duration of the section to trim, rather than the end  time. This is often misunderstood.