# compare.CudaToolkit.CudaSDK.NvidiaDriver.DockerRuntime.NvidiaToolKit

### CUDA Toolkit

```
 CUDA Toolkit is a software package that has different components. The main pieces are  
```

- CUDA SDK (The compiler, NVCC, libraries for developing CUDA software, and CUDA samples)
- GUI Tools (such as Eclipse Nsight for Linux/OS X or Visual Studio Nsight for Windows)
- Nvidia Driver (system driver for driving the card)
- It has also many other components such as CUDA-debugger, profiler, memory checker, etc.

### Check is CudaTooklit installed

```
 The fact that you are able to compile and run samples means that you probably installed the Toolkit fully and have the SDK, the driver, and the Samples at least.
```

### CudaDriver,Nvidia-driver,CudaToolKit

- cuda driver is libcuda.so which is included in nvidia driver and used by cuda runtime api
- Nvidia driver includes driver kernel module and user libraries.
- Cuda toolkit is an SDK contains compiler, api, libs, docs, etc...

### Docker runtime

- if(docker < 19.03)  then
   install nvidia-docker2    (no need to register the runtime)
   OR  install nvidia-container-runtime (need to register runtime)
   ** usage: *docker run - - runtime=nvidia* **
- if (docker >= 19.03) then
   just need to do "sudo apt-get install -y nvidia-container-toolkit",
   automatically call nvidia-container-runtime hook
   ** usage: *docker run      - - gpus all***

### Nvidia CUDA

- CUDA is a parallel computing platform and programming model developed by NVIDIA for general computing on graphical processing units (GPUs). With CUDA, developers can dramatically speed up computing applications by harnessing the power of GPUs.
- The CUDA Toolkit from NVIDIA provides everything you need to develop GPU-accelerated applications.
  - The CUDA Toolkit includes
    - GPU-accelerated libraries
    - a compiler
    - development tools
    - the CUDA runtime.
- The CUDA container images on Docker Hub provide an easy-to-use distribution for CUDA supported platforms and architectures.

### NVIDIA Container Runtime

- The NVIDIA Container Runtime for Docker is required to run CUDA images.
- For CUDA 10.0, nvida-docker2 or greater is required. Older versions of the NVIDIA runtime work but an un-supported.

### Operations for Docker19.03

- if your docker is > 19.03,then you just need to  NVIDIA runtime packages installed to play nvidia-gpu container, so how to install "Nvidia runtime packages"?
  - go to [nvidia/cuda(dockeehub)](https://hub.docker.com/r/nvidia/cuda/) ,click " NVIDIA Container Runtime " to install,in fact ,you need to do "***sudo apt-get install -y nvidia-container-toolkit\***"