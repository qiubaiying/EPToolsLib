//
//  UIView+HDIBInspectable.h
//  YQW
//
//  Created by suziqiang on 16/7/15.
//  Copyright (c) 2016年 YQW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (OPIBInspectable)

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

@property(nonatomic,assign) IBInspectable BOOL topLine;
@property(nonatomic,assign) IBInspectable BOOL bottomLine;
@property(nonatomic,assign) IBInspectable CGFloat bottomX;

@end
