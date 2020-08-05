```c++
//
//  main.cpp
//  移动物体识别
//
//  Created by ywy on 2016/10/10.
//  Copyright © 2016年 Swallow. All rights reserved.
//

#include "opencv2/imgcodecs.hpp"
#include "opencv2/imgproc.hpp"
#include "opencv2/videoio.hpp"
#include <opencv2/highgui.hpp>
#include <opencv2/video.hpp>

#include <stdio.h>
#include <iostream>
#include <sstream>

using namespace cv;
using namespace std;


Mat frame; //当前帧
Mat fgMaskMOG2; //通过MOG2方法得到的掩码图像fgmask
Mat segm;      //frame的副本

vector<vector<Point> > contours;
vector<Vec4i> hierarchy;
Ptr<BackgroundSubtractor> pMOG2; //MOG2 Background subtractor

//处理输入视频函数定义
void processVideo(char* str);

int main(int argc,char* argv[])
{
    //namedWindow("Original Frame");
    //namedWindow("After MOG2");

    //create Background Subtractor objects
    pMOG2 = createBackgroundSubtractorMOG2();
    
    processVideo(argv[1]);

    destroyAllWindows();
    return 0;
}


void processVideo(char* vedioAddress) {

    VideoCapture capture(vedioAddress); //参数为0，默认从摄像头读取视频

    if(!capture.isOpened()){
        cout << "Unable to open the camera! " << endl;
        exit(EXIT_FAILURE); //EXIT_FAILURE 可以作为exit()的参数来使用，表示没有成功地执行一个程序,其值为1
    }
   
    while( true ){

        if(!capture.read(frame)) {
            cout << "Unable to read next frame." << endl;
            exit(0);
        }

        //对画面进行一定的缩放，方便处理
        double scale = 1.3;         //缩放比例
        Mat smallImg(frame.rows / scale,frame.cols / scale,CV_8SC1);
        resize(frame, frame, smallImg.size(),0,0,INTER_LINEAR);

        pMOG2->apply(frame, fgMaskMOG2);    //更新背景模型 .srx:识别出来了背景，前景，白色为前景，黑色为背景，这和遮罩在三位模型制作中的意思是一样的

        frame.copyTo(segm);             //建立一个当前frame的副本
        findContours(fgMaskMOG2, contours, hierarchy,
                     CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE,Point(0,0)); //检测轮廓

        vector <vector<Point> > contours_poly( contours.size());//轮廓的个数
        vector <Point2f> center( contours.size());//轮廓的个数      
        vector <float> radius( contours.size());//轮廓的个数
        for( int i = 0; i < contours.size(); i++){
            //findContours后的轮廓信息contours可能过于复杂不平滑，可以用approxPolyDP函数对该多边形曲线做适当近似
            approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true);
            //得到轮廓的外包络圆
            minEnclosingCircle( contours_poly[i], center[i], radius[i]);    
        }

      
        //对所得到的轮廓进行一定的筛选
        for(int i = 0; i < contours.size(); i++ ){
            if (contourArea(contours[i]) > 500){
                circle(segm, center[i], (int)radius[i], Scalar(100, 100, 0), 2, 8, 0);
                break;
            }
        }       

     

        //get the frame number and write it on the current frame
        stringstream ss;
//        rectangle(frame, cv::Point(10, 2), cv::Point(100,20),
//                  cv::Scalar(255,255,255), -1);
        ss << capture.get(CAP_PROP_POS_FRAMES);
        string frameNumberString = ss.str();
        putText(frame, frameNumberString.c_str(), cv::Point(15, 15),
                FONT_HERSHEY_SIMPLEX, 0.5 , cv::Scalar(0,0,0));

        //显示
        imshow("frame", frame);
        imshow("Segm", segm);
        imshow("FG Mask MOG 2", fgMaskMOG2);


        int key;
        key = waitKey(5);
        if (key == 'q' || key == 'Q' || key == 27)
            break;


    }

    capture.release();
}
```



CMakeLists.txt:

```cmake
cmake_minimum_required(VERSION 3.5)
project( movingDetect_circleMark )

#opencv libs
find_package( OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(movingDetect_circleMark movingDetect_circleMark.cpp)
target_link_libraries(movingDetect_circleMark ${OpenCV_LIBS} pthread dl)
```





# brief

detect moving obj from a video ,if moving found ,then show a CIRCLE on the moving obj in a window and also  save as jpg

# details

the threshold is defined by user customized value,if the moving area (contor area) is bigger than threshold,then save the current frame as jpg， keydown 'Q' or 'q' to quit

# how to use

```
cmake . 
make
./movingDetet_circleMark xxx.mp4 ( or rtsp://xxxx/xxx)
```