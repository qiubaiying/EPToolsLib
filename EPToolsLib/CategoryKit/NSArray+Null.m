//
//  NSArray+Null.m
//  Epweike_Witkey
//
//  Created by epwk on 2017/5/12.
//  Copyright © 2017年 Epwk. All rights reserved.
//

#import "NSArray+Null.h"
#import "NSDictionary+Null.h"

@implementation NSArray(Null)

- (NSArray *)arrayByReplacingNullsWithBlanks {
    
    NSMutableArray *replaced = [self mutableCopy];
    
    const id nul = [NSNull null];
    
    const NSString *blank = @"";
    
    for (int idx = 0; idx < [replaced count]; idx++) {
        id object = [replaced objectAtIndex:idx];
        if (object == nul) {
            [replaced replaceObjectAtIndex:idx withObject:blank];
        } else if ([object isKindOfClass:[NSDictionary class]]) {
            [replaced replaceObjectAtIndex:idx withObject:[object dictionaryByReplacingNullsWithBlanks]];
        } else if ([object isKindOfClass:[NSArray class]]) {
            [replaced replaceObjectAtIndex:idx withObject:[object arrayByReplacingNullsWithBlanks]];
        }
    }
    
    return [replaced copy];
    
}

@end
