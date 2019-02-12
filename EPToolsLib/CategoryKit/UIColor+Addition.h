//
//  UIColor+Addition.h
//  EPWeiKe
//
//  Created by Mac on 15/7/29.
//  Copyright (c) 2015年 zengxusheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(Addition)

/**
 从十六进制字符串获取颜色，
 
 @param color color支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 从十六进制字符串获取颜色，

 @param color color支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @param alpha alpha
 @return Color
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/**
 随机颜色

 @return Color
 */
+(UIColor *) randomColor;

@end
