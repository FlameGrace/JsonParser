//
//  JsonParserStringNumberBoolValue.m
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserStringNumberBoolValue.h"

@implementation JsonParserStringNumberBoolValue

- (id)processInitialValue:(id)value;
{
    NSString * dValue = [JsonParseTool stringFromValue:value];
    if(!dValue)
    {
        return nil;
    }
    BOOL boolean = NO;
    if(dValue && [dValue isEqualToString:@"0"])
    {
        boolean = NO;
    }
    else if(dValue && [dValue isEqualToString:@"1"])
    {
        boolean = NO;
    }
    else
    {
        return nil;
    }
    NSNumber *number = [NSNumber numberWithBool:boolean];
    return number;
}

@end
