//
//  UIlabel+Addition.h
//  Epweike_Witkey
//
//  Created by epwk on 15/8/28.
//  Copyright (c) 2015年 zengxusheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel(Addition)

@property (nonatomic,assign) BOOL isCopyable;
/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


/**
 Lable 添加删除线

 @param text 文本
 */
- (void)setDeletedLineWithText:(NSString *)text;

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
