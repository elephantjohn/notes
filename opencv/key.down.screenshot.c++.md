```c++
#include "opencv2/core/core.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <unistd.h>
#include <sys/time.h>

using namespace cv;
using namespace std;

Mat image;   //读入视频帧的Mat
char* windowName="Video Control"; //播放窗口名称
char* trackBarName="播放进度";    //trackbar控制条名称
double totalFrame=1.0;     //视频总帧数
double currentFrame=1.0;    //当前播放帧
int trackbarValue=1;    //trackbar控制量
int trackbarMax=255;   //trackbar控制条最大值
double frameRate=1.0;  //视频帧率
VideoCapture video;    //声明视频对象
double controlRate=0.1;

//控制条回调函数
void TrackBarFunc(int ,void(*));
int main(int argc,char *argv[])
{
	//打开视频文件
	video.open(argv[1]);
	if(!video.isOpened())
	{
		std::cout<<"Failed to open video"<<std::endl;
	}
	totalFrame=video.get(CV_CAP_PROP_FRAME_COUNT);  //获取总帧数
	frameRate=video.get(CV_CAP_PROP_FPS);   //获取帧率
	double pauseTime=1000/frameRate; // 由帧率计算两幅图像间隔时间
	namedWindow(windowName);
	//在图像窗口上创建控制条
	createTrackbar(trackBarName,windowName,&trackbarValue,trackbarMax,TrackBarFunc);
	TrackBarFunc(0,0);
	string tmpImgPath;
	while (true)
	{
		video.read(image);
//		resize(image,image,Size(500,400)); //调整图像大小，视频在我的显示器上显示不全
		imshow(windowName,image); //显示图像
		//waitKey(pauseTime);   //图像间隔

        struct timeval tv;
		gettimeofday(&tv,NULL);
		int64_t timestamp = ((int64_t)(tv.tv_sec))*1000 + tv.tv_usec/1000; 
		tmpImgPath =   std::to_string(timestamp) + ".jpg";///home/srx/Work/testwilldel/screenshot_opencv
		int k = waitKey(pauseTime);
		if(k == 115 || k== 83)//115s 83S
		{
			imwrite("./"+tmpImgPath,image);
		}

		controlRate++;    
		if(controlRate>totalFrame)  //播放完成退出
		{
			break;
		}

	}
	video.release();  //释放视频，C++中不写也无碍，可以自动释放
	
	return 0;
}
void TrackBarFunc(int ,void(*))
{
	controlRate=(double)trackbarValue/trackbarMax*totalFrame; //trackbar控制条对视频播放进度的控制
	video.set(CV_CAP_PROP_POS_FRAMES,controlRate);	 //设置当前播放帧
}
```

CMakeLists.txt:

```cmake
cmake_minimum_required(VERSION 3.5)
project( keydownScreenshot )

# opencv 库
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
	
add_executable(keydownScreenshot  keydownScreenshot.cpp )
target_link_libraries( keydownScreenshot ${OpenCV_LIBS} pthread dl )
```





# brief

1. key down 's' or 'S' will take screenshot from a video
2. opencv related

# how to use

```
cmake .
make 
./keydownScreenshot xxx.mp4
```