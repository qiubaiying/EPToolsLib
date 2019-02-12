//
//  NSData+Helper.m
//  Epweike_Witkey
//
//  Created by epwk on 2018/4/9.
//  Copyright © 2018年 Epwk. All rights reserved.
//

#import "NSData+Helper.h"
#import <UIKit/UIKit.h>

@implementation NSData (Helper)

+(NSData *)zipNSDataWithImage:(UIImage *)sourceImage{
    //进行图像尺寸的压缩
    CGSize imageSize = sourceImage.size;//取出要压缩的image尺寸
    CGFloat width = imageSize.width;    //图片宽度
    CGFloat height = imageSize.height;  //图片高度
//    宽高均 <= 1280，图片尺寸大小保持不变
//    宽或高 > 1280 && 宽高比 <= 2，取较大值等于1280，较小值等比例压缩
//    宽或高 > 1280 && 宽高比 > 2 && 宽或高 < 1280，图片尺寸大小保持不变
//    宽高均 > 1280 && 宽高比 > 2，取较小值等于1280，较大值等比例压缩
    //1.宽高大于1280(宽高比不按照2来算，按照1来算)
//    if (width>1280||height>1280) {
//        if (width<height) {
//            CGFloat scale = height/width;
//            width = 1280;
//            height = width*scale;
//        }else{
//            CGFloat scale = width/height;
//            height = 1280;
//            width = height*scale;
//        }
//        //2.宽大于1280高小于1280
//    }else if(width>1280||height<1280){
//        CGFloat scale = height/width;
//        width = 1280;
//        height = width*scale;
//        //3.宽小于1280高大于1280
//    }else if(width<1280||height>1280){
//        CGFloat scale = width/height;
//        height = 1280;
//        width = height*scale;
//        //4.宽高都小于1280
//    }else{
//    }
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [sourceImage drawInRect:CGRectMake(0,0,width,height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //进行图像的画面质量压缩
    NSData *data=UIImageJPEGRepresentation(newImage, 0.8);
//    if (data.length>100*1024) {
//        if (data.length>2*1024*1024) {//2M以及以上
//            data=UIImageJPEGRepresentation(newImage, 0.7);
//        }else if (data.length>1024*1024) {//1M以上
//            data=UIImageJPEGRepresentation(newImage, 0.8);
//        }else if (data.length>512*1024) {// 0.5M以上
//            data=UIImageJPEGRepresentation(newImage, 0.9);
//        }
//    }
    return data;
}

@end
