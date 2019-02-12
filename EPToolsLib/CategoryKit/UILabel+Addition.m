//
//  UIlabel+Addition.m
//  Epweike_Witkey
//
//  Created by epwk on 15/8/28.
//  Copyright (c) 2015年 zengxusheng. All rights reserved.
//

#import "UIlabel+Addition.h"
#import <objc/runtime.h>

@implementation UILabel(Addition)


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copyText:));
}

- (void)attachTapHandler {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *g = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:g];
}

//  处理手势相应事件
- (void)handleTap:(UIGestureRecognizer *)g {
    [self becomeFirstResponder];
    
    UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyText:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:item]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
}

//  复制时执行的方法
- (void)copyText:(id)sender {
    //  通用的粘贴板
    UIPasteboard *pBoard = [UIPasteboard generalPasteboard];
    
    //  有些时候只想取UILabel的text中的一部分
    if (objc_getAssociatedObject(self, @"expectedText")) {
        pBoard.string = objc_getAssociatedObject(self, @"expectedText");
    } else {
        
        //  因为有时候 label 中设置的是attributedText
        //  而 UIPasteboard 的string只能接受 NSString 类型
        //  所以要做相应的判断
        if (self.text) {
            pBoard.string = self.text;
        } else {
            pBoard.string = self.attributedText.string;
        }
    }
}

- (BOOL)canBecomeFirstResponder {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}

- (void)setIsCopyable:(BOOL)number {
    objc_setAssociatedObject(self, @selector(isCopyable), [NSNumber numberWithBool:number], OBJC_ASSOCIATION_ASSIGN);
    [self attachTapHandler];
}

- (BOOL)isCopyable {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}


/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

- (void)showCountDownWithSecond:(NSUInteger)second displayType:(NSInteger)displayType{
    
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
        self.text = strTime;
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

/**
 Lable 添加删除线
 
 @param text 文本
 */
- (void)setDeletedLineWithText:(NSString *)text {
    
//    NSAttributedString *attrStr =
//    [[NSAttributedString alloc]initWithString:text
//                                  attributes:
//  @{NSFontAttributeName:[UIFont systemFontOfSize:20.f],
//    NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#5bcec0"],
//    NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),
//    NSStrikethroughColorAttributeName:[UIColor colorWithHexString:@"#5bcec0"]}];
    
    NSString *str = [text stringByAppendingString:@" "];
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:str attributes: @{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    
    self.attributedText = attrStr;
    
    
}

@end
