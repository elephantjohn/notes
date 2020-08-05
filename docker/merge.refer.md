\#merge two images to one refer:[multistage](https://docs.docker.com/develop/develop-images/multistage-build/)

### we have 2 ways to do that

##### (1) the two images all exist

every image has its own entrypoint, that's ok.
 just  write a Dockerfile to merge 2 images,we name it DockerfileBig,so DockerfileBig can have its own WORKDIR (maybe entrypoint too,havn't test). it looks like:

```dockerfile
FROM nima-gpu:latest AS builder

FROM szface-gpu-v3

COPY --from=builder .  /

WORKDIR /src   
```

\#####(2) the two images havn't exist
 write every thing in one Dockerfile,see the [refer](https://docs.docker.com/develop/develop-images/multistage-build/)

