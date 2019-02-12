//
//  UIView+Line.m
//  Dutyfreestore
//
//  Created by wade on 15/12/7.
//  Copyright © 2015年 Fow Tech. All rights reserved.
//

#import "UIView+Line.h"
#import "CategoryUtil.h"

@implementation UIView (Line)


-(void)addBottomLine {
    CALayer *xian = [CALayer layer];
    
    [xian setBackgroundColor:EP_SEPARATION_LINE_COLOR.CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = CGRectMake(0, self.frame.size.height - 0.5, kScreenWith, 0.5);
    [self.layer addSublayer:xian];
}
-(void)addTopLine {
    CALayer *xian = [CALayer layer];
    [xian setBackgroundColor:EP_SEPARATION_LINE_COLOR.CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = CGRectMake(0, 0, kScreenWith, 0.5);
    [self.layer addSublayer:xian];
}
-(void)addMiddleLine:(CGRect)setFrame {
    CALayer *xian = [CALayer layer];
    [xian setBackgroundColor:EP_SEPARATION_LINE_COLOR.CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = setFrame;
    [self.layer addSublayer:xian];
}

- (void)addMiddleLineWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width {
    [self addMiddleLine:CGRectMake(x, y, width, 0.5)];
}

- (void)addLineInBottomLayer:(CGRect)setFrame {
    CALayer *xian = [CALayer layer];
    [xian setBackgroundColor:EP_SEPARATION_LINE_COLOR.CGColor];
    //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
    xian.frame = setFrame;
    [self.layer insertSublayer:xian atIndex:0];
}

- (void)addButtomLineWithX:(CGFloat)x Y:(CGFloat)y {

    [self addMiddleLineWithX:x Y:y Width:kScreenWith - x];
}

- (void)addCellBottomLineWithY:(CGFloat)y {

    [self addMiddleLine:CGRectMake(15, y - 0.5, kScreenWith - 15, 0.5)];
}


@end
