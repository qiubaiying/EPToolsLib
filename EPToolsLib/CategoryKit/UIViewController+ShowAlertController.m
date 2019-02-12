//
//  UIViewController+ShowAlertController.m
//  GreenLink-iOS
//
//  Created by 邱柏荧 on 2017/9/28.
//  Copyright © 2017年 GreenLink. All rights reserved.
//

#import "UIViewController+ShowAlertController.h"

@implementation UIViewController (ShowAlertController)

-(void)showAlertControllerWithTitle:(NSString *)title message:(NSString *)message okBtnTitle:(NSString *)okTitle cancelBtnTitle:(NSString *)cancelTitle handler:(AlertControllerBlock )handler; {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];

//    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:title];
//    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, [[AttributedStr string] length])];
//    [AttributedStr addAttribute:NSForegroundColorAttributeName value:GLColorgBlack range:NSMakeRange(0, [[AttributedStr string] length])];
//    [alertController setValue:AttributedStr forKey:@"attributedTitle"];
    
    // okBtn
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        if (handler) {
            handler();
        }
        
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
    
    
//    [cancelAction setValue:GLColorgGray forKey:@"titleTextColor"];
//    [okAction setValue:GLColorBlue forKey:@"titleTextColor"];
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showActionSheetWithTitle:(NSString *)title message:(NSString *)message titleArray:(NSArray *)titleArray actionSheetBlock:(ActionSheetBlock)actionSheetBlock {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    for (int i = 0; i < titleArray.count ; i++) {
        UIAlertAction *action=[UIAlertAction actionWithTitle:titleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (actionSheetBlock) {
                actionSheetBlock(i);
            }
        }];
        [alertController addAction:action];
    }
    

    UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (actionSheetBlock) {
            actionSheetBlock(-1);
        }
    }];
    [alertController addAction:actionCancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
}




@end
