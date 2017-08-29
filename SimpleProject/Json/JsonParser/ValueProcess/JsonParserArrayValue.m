//
//  JsonParserArrayValueProcess.m
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserArrayValue.h"

@implementation JsonParserArrayValue

- (id)processInitialValue:(id)value;
{
    id dValue = [JsonParseTool arrayFromValue:value];
    return dValue;
}

@end
