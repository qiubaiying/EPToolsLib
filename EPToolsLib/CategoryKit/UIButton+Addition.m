//
//  UIButton+Addition.m
//  Epweike_Witkey
//
//  Created by epwk on 15/9/8.
//  Copyright (c) 2015年 zengxusheng. All rights reserved.
//

#import "UIButton+Addition.h"

@implementation UIButton(Addition)

-(BOOL)canBecomeFirstResponder {
    return YES;
}


- (void)showCountDownWithSecond:(NSUInteger)second displayType:(NSInteger)displayType {
    
    __block NSUInteger timeout = second; //倒计时时间
    [self backTextTitle:displayType timeout:timeout];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
            });
        }else{
            
            [self backTextTitle:displayType timeout:timeout];
            
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}

- (void)backTextTitle:(NSInteger)displayType timeout:(NSInteger)timeout{
    NSString *strTime;
    switch (displayType) {
            
        case -1:
            strTime = [self getCHHMMSSFromSS:timeout];
            break;
        case 0:
            strTime = [self getHHMMSSFromSS:timeout];
            break;
        case 1:
            strTime = [self getDHHMMSSFromSS:timeout];
            break;
        case 2:
            strTime = [self getHHFormSS:timeout];
            break;
        case 3:
            strTime = [self getMMFormSS:timeout];
            break;
        case 4:
            strTime = [self getSSFormSS:timeout];
            break;
            
        default:
            strTime = [self getHHMMSSFromSS:timeout];
            break;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //设置界面的按钮显示 根据自己需求设置
        
        [self setTitle:[NSString stringWithFormat:@"距订单关闭时间还有:%@", strTime] forState:UIControlStateNormal];
    });
}

/// 00小时00分00秒
- (NSString *)getCHHMMSSFromSS:(NSUInteger)totalTime{
    
    NSUInteger seconds = totalTime;
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@小时%@分%@秒",str_hour,str_minute,str_second];
    
    return format_time;
    
}
- (NSString *)getHHMMSSFromSS:(NSUInteger)totalTime{
    
    NSUInteger seconds = totalTime;
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
    
}

- (NSString *)getDHHMMSSFromSS:(NSUInteger)totalTime {
    NSUInteger seconds = totalTime;
    
    //format of Day
    NSString *str_day = [NSString stringWithFormat:@"%ld",seconds/(3600*24)];
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",(seconds%(3600*24))/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@天%@小时%@分%@秒", str_day, str_hour, str_minute, str_second];
    
    return format_time;
}


- (NSString *)getHHFormSS:(NSUInteger)totalTime {
    NSUInteger seconds = totalTime;
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",(seconds%(3600*24))/3600];
    return str_hour;
}

- (NSString *)getMMFormSS:(NSUInteger)totalTime {
    NSUInteger seconds = totalTime;
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    return str_minute;
}

- (NSString *)getSSFormSS:(NSUInteger)totalTime {
    NSUInteger seconds = totalTime;
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    return str_second;
}

@end
