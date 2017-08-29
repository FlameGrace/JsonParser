//
//  JsonParserDicValue.m
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserDicValue.h"

@implementation JsonParserDicValue

- (id)processInitialValue:(id)value;
{
    id dValue = [JsonParseTool dicFromValue:value];
    return dValue;
}

@end
