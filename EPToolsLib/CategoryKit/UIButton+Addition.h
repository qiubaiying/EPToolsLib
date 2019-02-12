//
//  UIButton+Addition.h
//  Epweike_Witkey
//
//  Created by epwk on 15/9/8.
//  Copyright (c) 2015年 zengxusheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton(Addition)

/**
 限时倒计时
 
 @param second 倒计时秒数
 @param displayType
 展示的时间格式
 -1、00小时00分00秒
 0、 00:00:00
 1、0天00小时00分00秒
 2、00(小时) 3、00(分) 4、00（秒）
 */
- (void)showCountDownWithSecond:(NSUInteger)second displayType:(NSInteger)displayType;
@end
