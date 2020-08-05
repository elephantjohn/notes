### the  difference between nvidia-docker2,docker-runtime,nvidia-toolkit

- if(docker < 19.03)  then
   install nvidia-docker2    (no need to register the runtime)
   OR  install nvidia-container-runtime (need to register runtime)
   ** usage: *docker run - - runtime=nvidia* **
- if (docker >= 19.03) then
   just need to do "sudo apt-get install -y nvidia-container-toolkit",
   automatically call nvidia-container-runtime hook
   ** usage: *docker run      - - gpus all***