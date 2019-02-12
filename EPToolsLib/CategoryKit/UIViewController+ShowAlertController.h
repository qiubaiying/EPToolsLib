//
//  UIViewController+ShowAlertController.h
//  GreenLink-iOS
//
//  Created by 邱柏荧 on 2017/9/28.
//  Copyright © 2017年 GreenLink. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^AlertControllerBlock)(void);
typedef void(^ActionSheetBlock)(NSInteger idx);


@interface UIViewController (ShowAlertController)


/// 弹出框
-(void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message okBtnTitle:(NSString *)okTitle cancelBtnTitle:(NSString *)cancelTitle handler:(AlertControllerBlock )handler;

/// 底部弹出框 idx -1为取消
- (void)showActionSheetWithTitle:(NSString *)title message:(NSString *)message titleArray:(NSArray *)titleArray actionSheetBlock:(ActionSheetBlock)actionSheetBlock;


@end
