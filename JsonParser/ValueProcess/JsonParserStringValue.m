//
//  JsonParserStringValueProcess.m
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserStringValue.h"

@implementation JsonParserStringValue

- (id)processInitialValue:(id)value;
{
    id dValue = [JsonParseTool stringFromValue:value];
    return dValue;
}

@end
