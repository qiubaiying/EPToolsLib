//
//  UIView+HDIBInspectable.m
//  YQW
//
//  Created by suziqiang on 16/7/15.
//  Copyright (c) 2016年 YQW. All rights reserved.
//

#import "UIView+OPIBInspectable.h"
#import "Header.h"

@implementation UIView (OPIBInspectable)

#pragma mark - setCornerRadius/borderWidth/borderColor
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}


- (BOOL)bottomLine {
    return [objc_getAssociatedObject(self, @selector(bottomLine)) boolValue];
}

- (BOOL)topLine {
    return [objc_getAssociatedObject(self, @selector(topLine)) boolValue];
}

- (CGFloat)bottomX {
    return [objc_getAssociatedObject(self, @selector(bottomX)) floatValue];
}


- (void)setBottomLine:(BOOL)bottomLine {
    objc_setAssociatedObject(self, @selector(bottomLine), @(bottomLine),OBJC_ASSOCIATION_ASSIGN);
    if (bottomLine) {
        CALayer *xian = [CALayer layer];
        [xian setBackgroundColor:EP_SEPARATION_LINE_COLOR.CGColor];
        //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
        xian.frame = CGRectMake(0, self.mj_h - 0.5, ScreenWith, 0.5);
        [self.layer addSublayer:xian];
    }
}


- (void)setTopLine:(BOOL)topLine {
    
    objc_setAssociatedObject(self, @selector(topLine), @(topLine), OBJC_ASSOCIATION_ASSIGN);
    if (topLine) {
        CALayer *xian = [CALayer layer];
        [xian setBackgroundColor:EP_SEPARATION_LINE_COLOR.CGColor];
        //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
        xian.frame = CGRectMake(0, 0, ScreenWith, 0.5);
        [self.layer addSublayer:xian];
    }
}

- (void)setBottomX:(CGFloat)bottomX {
    objc_setAssociatedObject(self, @selector(bottomX), @(bottomX), OBJC_ASSOCIATION_ASSIGN);
    if (bottomX >0.01) {
        CALayer *xian = [CALayer layer];
        [xian setBackgroundColor:EP_SEPARATION_LINE_COLOR.CGColor];
        //[xian setDk_backgroundColorPicker:DKColorPickerWithKey(@"LINE")];
        xian.frame = CGRectMake(bottomX, self.mj_h - 0.5, ScreenWith - bottomX, 0.5);
        [self.layer addSublayer:xian];
    }
}


@end
