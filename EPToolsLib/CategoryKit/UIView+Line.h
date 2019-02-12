//
//  UIView+Line.h
//  Dutyfreestore
//
//  Created by wade on 15/12/7.
//  Copyright © 2015年 Fow Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Line)

/**
 *  给view底部加0.5的线
 */
-(void)addBottomLine;
/**
 *  给view顶部部加0.5的线
 */
-(void)addTopLine;

/**
 *  给view中间加0.5的线
 */
-(void)addMiddleLine:(CGRect)setFrame;


/**
 *  给view添加加0.5的线
 */
- (void)addMiddleLineWithX:(CGFloat)x Y:(CGFloat)y Width:(CGFloat)width;

/**
 *  添加线到最底层
 */
- (void)addLineInBottomLayer:(CGRect)setFrame;


/**
 添加Cell分割线
 */
- (void)addCellBottomLineWithY:(CGFloat)y;



/**
 添加底部线 长为与 底边-x

 @param x x
 @param y y
 */
- (void)addButtomLineWithX:(CGFloat)x Y:(CGFloat)y;
@end
