//
//  NSDictionary+Null.m
//  Epweike_Witkey
//
//  Created by epwk on 2017/5/12.
//  Copyright © 2017年 Epwk. All rights reserved.
//

#import "NSDictionary+Null.h"
#import "NSArray+Null.h"


@implementation NSDictionary(Null)

- (NSDictionary *)dictionaryByReplacingNullsWithBlanks {
    
    const NSMutableDictionary *replaced = [self mutableCopy];
    
    const id nul = [NSNull null];
    
    const NSString *blank = @"";
    
    for (NSString *key in self) {
        
        id object = [self objectForKey:key];
        
        if (object == nul) {
           [replaced setObject:blank forKey:key];
        } else if ([object isKindOfClass:[NSDictionary class]]) {
           [replaced setObject:[object dictionaryByReplacingNullsWithBlanks] forKey:key];
        } else if ([object isKindOfClass:[NSArray class]]) {
            [replaced setObject:[object arrayByReplacingNullsWithBlanks] forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
    
}

@end
