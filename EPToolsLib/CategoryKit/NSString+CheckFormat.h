//
//  NSString+CheckFormat.h
//  Ep_MasterProject
//
//  Created by BY on 2018/7/26.
//  Copyright © 2018年 epwk. All rights reserved.
//
//  表单格式验证

#import <Foundation/Foundation.h>

@interface NSString (CheckFormat)

/** 验证邮箱 */
- (BOOL)isFormatEmail;

/** 验证手机号 */
- (BOOL)isFormatPhone;

/** 验证密码 */
- (BOOL)isFormatPassword;

/** 验证简单密码 */
- (BOOL)isFormatSimplePassword;

/** 验证用户名 */
- (BOOL)isFormatUserName;

/** 验证真实姓名 6位以内中文 */
- (BOOL)isFormatName;

/** 验证身份证 */
- (BOOL)isFormatIdCard;

/** 验证URL */
- (BOOL)isFormatURL;

/** 验证柜号 4英文+6数字+1校验码 */
- (BOOL)isFormatContainerNum;

/** 验证铅封号 5-15数字字母组合 */
- (BOOL)isFormatSealNum;

@end
