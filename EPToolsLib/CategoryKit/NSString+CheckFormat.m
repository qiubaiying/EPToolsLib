//
//  NSString+CheckFormat.m
//  Ep_MasterProject
//
//  Created by BY on 2018/7/26.
//  Copyright © 2018年 epwk. All rights reserved.
//

#import "NSString+CheckFormat.h"

@implementation NSString (CheckFormat)

/** 验证邮箱 */
- (BOOL)isFormatEmail {
    
    NSString *emailRegex = @"[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

/** 验证手机号 */
- (BOOL)isFormatPhone {
    NSString *phoneRegex = @"1[3-8][0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

/** 验证密码 */
- (BOOL)isFormatPassword {
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9-~!@#$%^&*()_+=<>?:';/.,]{8,20}";
    //NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$){6,20}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

/** 验证简单密码 */
- (BOOL)isFormatSimplePassword {
    NSString *pattern = @"^{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

/** 验证用户名 */
- (BOOL)isFormatUserName {
    
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:self];
}

/** 验证真实姓名 6位以内中文 */
- (BOOL)isFormatName {
    NSString *userNameRegex = @"^[\u4E00-\u9FA5]{1,6}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:self];
}

/** 验证身份证 */
- (BOOL)isFormatIdCard {
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
    
}

/** 验证URL */
- (BOOL)isFormatURL {
    NSString *pattern = @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

/** 验证柜号 4英文+6数字+1校验码 */
- (BOOL)isFormatContainerNum {
    NSString *pattern = @"^[A-Za-z]{4}[0-9]{7}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

/** 验证铅封号 5-15数字字母组合 */
- (BOOL)isFormatSealNum {
    NSString *pattern = @"^[a-zA-Z0-9]{5,15}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

@end
