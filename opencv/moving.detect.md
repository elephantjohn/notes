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

#include <unistd.h>
#include <sys/time.h>


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

    bool isSave = false;//save a img or not ,when capture a moving ,then save
    int j=0;//add by srx
    Point2f vtx[4];           
    while( true ){

        if(!capture.read(frame)) {
            cout << "Unable to read next frame." << endl;
            exit(0);
        }

        //对画面进行一定的缩放，方便处理
        // double scale = 1.3;         //缩放比例
        // Mat smallImg(frame.rows / scale,frame.cols / scale,CV_8SC1);
        // resize(frame, frame, smallImg.size(),0,0,INTER_LINEAR);

        pMOG2->apply(frame, fgMaskMOG2);    //更新背景模型 .srx:识别出来了背景，前景，白色为前景，黑色为背景，这和遮罩在三位模型制作中的意思是一样的

        frame.copyTo(segm);             //建立一个当前frame的副本
        findContours(fgMaskMOG2, contours, 
                     CV_RETR_EXTERNAL, CV_CHAIN_APPROX_SIMPLE,Point(0,0)); //检测轮廓
        cout << "size of contours"<<contours.size()<<endl;
        vector <vector<Point> > contours_poly( contours.size());//轮廓的个数
        vector <Point2f> center( contours.size());//轮廓的个数
        vector <RotatedRect> rects(contours.size());//add by srx
        vector< vector <Point2f>> rectPoins(contours.size());//add by srx
        vector <float> radius( contours.size());//轮廓的个数
        for( int i = 0; i < contours.size(); i++){
            //findContours后的轮廓信息contours可能过于复杂不平滑，可以用approxPolyDP函数对该多边形曲线做适当近似
            approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true);
            //得到轮廓的外包络圆
            minEnclosingCircle( contours_poly[i], center[i], radius[i]);//origin           
            rects[i] =minAreaRect( contours_poly[i]);//add by srx

            //Point2f vtx[4];           
            rects[i].points(vtx);
            rectPoins[i].push_back(vtx[0]);
            rectPoins[i].push_back(vtx[1]);
            rectPoins[i].push_back(vtx[2]);
            rectPoins[i].push_back(vtx[3]);           
        }
       
       

       //add by srx
       // Draw the rect      
        for( int i = 0; i < contours.size(); i++)
        {
            for( j = 0; j< 4; j++ )
            {
               if (contourArea(contours[i]) > 500)
               {
                   isSave =  true;
               
                line(segm, rectPoins[i][j], rectPoins[i][(j+1)%4], Scalar(0, 255, 0), 1, LINE_AA);
               }
            }
        }
       //end add

       //if capture a moving obj ,then save
       if(true == isSave)
       {
            struct timeval tv;
            gettimeofday(&tv,NULL);
            int64_t timestamp = ((int64_t)(tv.tv_sec))*1000 + tv.tv_usec/1000; 
            string tmpImgPath =   std::to_string(timestamp) + ".jpg";
            imwrite(tmpImgPath,frame); //capture a moving obj,save the img
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
project( movingDetect )

#opencv libs
find_package( OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(movingDetect movingDetect.cpp)
target_link_libraries(movingDetect ${OpenCV_LIBS} pthread dl)
```





# brief

detect moving obj from a video ,if moving found ,then show a rect on the moving obj in a window and also  save as jpg

# details

the threshold is defined by user customized value,if the moving area (contor area) is bigger than threshold,then save the current frame as jpg， keydown 'Q' or 'q' to quit

# how to use

```
cmake . 
make
./movingDetet xxx.mp4 ( or rtsp://xxxx/xxx)
```