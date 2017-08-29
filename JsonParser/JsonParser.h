//
//  JsonParser.h
//  flamegrace@hotmail.com
//
//  Created by Flame Grace on 2017/6/14.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//json数据解析给model

#import <Foundation/Foundation.h>
#import "JsonParseTool.h"
#import "JsonParserFormat.h"

@interface JsonParser : NSObject

/**
 支持单层json转Model的解析
 @param json 可以是NSData或NSString或NSDictionry
 @param model 要获得json值的对象
 @param formats 针对每个键的解析规则数组
 @return 是否解析成功
 */
+ (NSError *)parserJson:(id)json forModel:(id)model withFormats:(NSArray<JsonParserFormat *>*)formats;
//参见[JsonParserFormat formatsFromFormatDicArray:];
+ (NSError *)parserJson:(id)json forModel:(id)model withFormatDicArray:(NSArray<NSDictionary *>*)formatDicArray;

@end
