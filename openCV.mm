//
//  openCV.m
//  openCV
//
//  Created by rin on 2016/04/13.
//  Copyright © 2016年 rin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "openCV-Bridging-Header.h"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

@implementation openCV : NSObject

+(UIImage *)DetectEdgeWithImage:(UIImage *)image{
    
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, CV_BGR2GRAY);
    
    cv::Mat edge;
    cv::Canny(gray, edge, 200, 180);
    
    UIImage *edgeImg = MatToUIImage(edge);
    
    return edgeImg;
}

@end