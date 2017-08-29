//
//  JsonParser.m
//  flamegrace@hotmail.com
//
//  Created by Flame Grace on 2017/6/14.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParser.h"

@implementation JsonParser

+ (NSError *)parserJson:(id)json forModel:(id)model withFormats:(NSArray<JsonParserFormat *>*)formats
{
    NSDictionary *dic = [JsonParseTool dicForJson:json];
    if(!dic || !formats)
    {
        return [NSError errorWithDomain:JsonParserFormat_ErrorDomin code:1 userInfo:@{@"reason":@"json为空或formats为空"}];
    }
    for (JsonParserFormat *format in formats)
    {
        NSError *error = nil;
        
        if(format.dic)
        {
            error = [format parseDic:format.dic forModel:model];
        }
        else
        {
            error = [format parseDic:dic forModel:model];
        }
        if(error)
        {
            return error;
        }
    }
    return nil;
}

+ (NSError *)parserJson:(id)json forModel:(id)model withFormatDicArray:(NSArray<NSDictionary *>*)formatDicArray
{
    NSArray *formats = [JsonParserFormat formatsFromFormatDicArray:formatDicArray];
    NSError *error = [JsonParser parserJson:json forModel:model withFormats:formats];
    return error;
}

@end
