//
//  JsonParserStringBooleanNumberValue.m
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserStringBooleanBoolValue.h"

@implementation JsonParserStringBooleanBoolValue

- (id)processInitialValue:(id)value;
{
    NSString * dValue = [JsonParseTool stringFromValue:value];
    if(!dValue)
    {
        return nil;
    }
    BOOL boolean = NO;
    if(dValue && [dValue isEqualToString:@"false"])
    {
        boolean = NO;
    }
    else if(dValue && [dValue isEqualToString:@"true"])
    {
        boolean = YES;
    }
    else
    {
        return nil;
    }
    NSNumber *number = [NSNumber numberWithBool:boolean];
    return number;
}

@end
