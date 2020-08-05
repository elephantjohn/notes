# The OpenCV and CMakeLists.txt

### 1. How to find the opencv infos in CMakeLists.txt

add the following sentences in CMakeLists.txt :

```cmake
find_package(OpenCV REQUIRED)

message("find OpenCV_INCLUDE_DIRS: ${OpenCV_INCLUDE_DIRS}")
message("find OpenCV_LIBS: ${OpenCV_LIBS}")
message("find OpenCV_DIR: ${OpenCV_DIR}")
```

and the do :

```bash
cmake ..
```

the see the output of screen, you may see something like:

> find OpenCV_INCLUDE_DIRS: /usr/local/include/opencv4 find OpenCV_LIBS: opencv_calib3d;opencv_core;opencv_dnn;opencv_features2d;opencv_flann;opencv_gapi;opencv_highgui;opencv_imgcodecs;opencv_imgproc;opencv_ml;opencv_objdetect;opencv_photo;opencv_stitching;opencv_video;opencv_videoio find OpenCV_DIR: /usr/local/lib/cmake/opencv4 -- Configuring done -- Generating done -- Build files have been written to: /home/srx/Work/tmptest/learn_cmake_opencv/build

### 2. What is OpenCV_INCLUDE_DIRS/OpenCV_LIBS/OpenCV_DIR

##### 2.1 OpenCV_INCLUDE_DIRS

the include directories that the project get the header files.

you dont need to write the include_directories(${OpenCV_INCLUDE_DIRS}) if find_package(OpenCV) is writed.

for example. the two forms below are the same:

form 1:

```cmake
find_package(OpenCV RQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
```

form 2:

```cmake
find_package(OpenCV RQUIRED)
```

**tips**:

if you add a redundant include_directories(what_ever_in_here), the cmake wont tells an error, for example:

```cmake
find_package(OpenCV RQUIRED)
# include_directories(${OpenCV_INCLUDE_DIRS}) # this line can be commeted,because find_package(OpenCV) exist above

# below 3 sentences wont tell error
include_directories(aaa)
include_directories(bbb/home/srx/)
include_directories(any_string)
```

##### 2.2 OpenCV_LIBS

when linking to the opencv libs, the project get libs from these libs.

you can use :

```cmake
target_link_libraries(my_exe ${OpenCV_LIBS})
```

Also, you can specific the libs use "target_link_libraries", as follows:

```cmake
link_directories(/home/xxx/xxx/opencv-4/build/installed/lib)

target_link_libraries(my_exe opencv_imgproc opencv_highgui opencv_video opencv_videoio)
```

Also , you dont need specify the "link_directories" if you use"find_packages(OpenCV)" before, as follows:

```cmake
find_package(OpenCV    RQUIRED)

# dont need to specify opencvlib by link_directories(/home/xxx/.../lib), because "find_packages(OpenCV   RQUIRED)" exits before 
target_link_libraries(my_exe opencv_core opencv_imgcodecs opencv_imgproc opencv_highgui opencv_video opencv_videoio)	
```

**tips**:

if  you add a redundant link_directories(what_ever_in_here), the cmake wont tells an error, for example:

```cmake
find_package(OpenCV 	RQUIRED)

# the below 2 lines wont tell error
link_directories(aaa/home/77/88)
link_directories(any_string)


target_link_libraries(my_exe opencv_core opencv_imgcodecs opencv_imgproc opencv_highgui opencv_video opencv_videoio)	
```

##### 2.3 OpenCV_DIR

###### 2.3.1 the location of OpenCV_DIR

the direcotory may located in :

```
/usr/local/lib/cmake/opencv4
```

OR may located in:

```
/usr/local/opencv4/lib/cmake/opencv4
```

OR other places, see the out of:

```cmake
message("find OpenCV_DIR: ${OpenCV_DIR}")
```

###### 2.3.2 the contents below OpenCV_DIR

the contents in this files may look like:

```cmake
OpenCVConfig.cmake
OpenCVConfig-version.cmake
OpenCVModules.cmake
OpenCVModules-release.cmake
```

tif you want to see the version of cmake , then see the file OpenCVConfig-version.cmake,

the content in OpenCVConfig-version.cmake are as follows:

```cmake
set(OpenCV_VERSION 4.2.0)
....
```

### 3. How to specify a OpenCV version in CMakeLists.txt

##### 3.1 Default version

if you use the form below its default version:

```cmake
find_package(OpenCV REQUIRED)
```

##### 3.2 Specific version

if you use a specific verson as follows, it will find the "suitable" version.

```cmake
find_package(OpenCV 3.3 REQUIERD)
OR 
find_package(OpenCV 3.3.2 REQUIERD)
```

this time, you want 3.3.2 version, but your pc dont has the 3.3.2 , then it will find the "suitable" version for you ,maybe 3.4.* .

for example , if i dont have 3.3 , but i use the version in CMakeLists.txt as follows:

```cmake
find_package(OpenCV 3.3 REQUIRED)
```

then i cmake .., the output will looks like:

> -- Found OpenCV: /usr/local (found suitable version "3.4.2", minimum required is "3.3")

OR , if i use 3.3.2 instead 3.3, the output is very similar:

```cmake
find_package(OpenCV 3.3.2 REQUIRED)
```

> -- Found OpenCV: /usr/local (found suitable version "3.4.2", minimum required is "3.3.2")