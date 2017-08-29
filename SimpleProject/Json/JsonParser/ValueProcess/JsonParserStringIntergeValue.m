//
//  JsonParserStringNumberValue.m
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserStringIntergeValue.h"

@implementation JsonParserStringIntergeValue

- (id)processInitialValue:(id)value;
{
    NSString * dValue = [JsonParseTool stringFromValue:value];
    if(!dValue)
    {
        return nil;
    }
    NSNumber *number = [NSNumber numberWithInteger:dValue.integerValue];
    return number;
}

@end
