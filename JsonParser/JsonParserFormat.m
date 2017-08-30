//
//  JsonParserFormat.m
//  flamegrace@hotmail.com
//
//  Created by Flame Grace on 2017/6/14.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserFormat.h"


@implementation JsonParserFormat

- (instancetype)init
{
    if(self = [super init])
    {
        self.checkType = JsonParserCheckMustKeyAndValue;
        self.valueProcess = [JsonParserStringValue model];
    }
    return self;
}

+ (instancetype)format
{
    return [[self alloc]init];
}

+ (JsonParserFormat *)formatFromFormatDic:(NSDictionary *)formatDic
{
    formatDic = [JsonParseTool dicForJson:formatDic];
    if(!formatDic)
    {
        return nil;
    }
    NSString *key = [JsonParseTool stringFromValue:formatDic[JsonParserFormat_Key]];
    if(!key||(key&&key.length < 1))
    {
        return nil;
    }
    NSString *modelKeyPath = [JsonParseTool stringFromValue:formatDic[JsonParserFormat_ModelKeyPath]];
    if(!modelKeyPath)
    {
        modelKeyPath = key;
    }
    NSNumber *checkType = [JsonParseTool numberFromValue:formatDic[JsonParserFormat_CheckType]];
    NSDictionary *dic = [JsonParseTool dicForJson:formatDic[JsonParserFormat_Dic]];
    JsonParserFormat *format = [JsonParserFormat formatWithKey:key modelKeyPath:modelKeyPath];
    if(checkType)
    {
        format.checkType = checkType.integerValue;
    }
    JsonParserValueProcess *valueProcess = formatDic[JsonParserFormat_ValueProcess];
    if(valueProcess&&[valueProcess conformsToProtocol:@protocol(JsonParserValueProcessProtocol)])
    {
        format.valueProcess = valueProcess;
    }
    format.dic = dic;
    
    return format;
}

+ (NSArray <JsonParserFormat *> *)formatsFromFormatDicArray:(NSArray <NSDictionary *> *)formatDicArray
{
    NSMutableArray *formats = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in formatDicArray)
    {
        JsonParserFormat *format = [JsonParserFormat formatFromFormatDic:dic];
        if(format)
        {
           [formats addObject:format];
        }
    }
    return formats;
}

+ (instancetype)formatWithKey:(NSString *)key modelKeyPath:(NSString *)modelKeyPath
{
    JsonParserFormat *format = [[self alloc]init];
    format.key = key;
    format.modelKeyPath = modelKeyPath;
    return format;
}



+ (instancetype)formatWithKey:(NSString *)key modelKeyPath:(NSString *)modelKeyPath valueProcess:(Class <JsonParserValueProcessProtocol>)valueProcess
{
    JsonParserFormat *format = [self formatWithKey:key modelKeyPath:modelKeyPath];
    format.valueProcess = valueProcess;
    return format;
}

- (NSError *)parseDic:(NSDictionary *)dic getValue:(id *)value
{
    
    dic = [JsonParseTool dicForJson:dic];
    if(!dic && !self.key)
    {
        return [NSError errorWithDomain:JsonParserFormat_ErrorDomin code:1 userInfo:@{@"reason":@"key为空或dic为空"}];
    }
    
    if(![JsonParseTool hasKey:self.key inDic:dic])
    {
        //检查是否有指定键
        if(self.checkType == JsonParserCheckMustKey || self.checkType == JsonParserCheckMustKeyAndValue)
        {
            return [NSError errorWithDomain:JsonParserFormat_ErrorDomin code:1 userInfo:@{@"reason":[NSString stringWithFormat:@"未包含指定key:%@",self.key]}];
        }
        return nil;
    }
    
    id dValue = dic[self.key];
    if(self.valueProcess)
    {
        dValue =[self.valueProcess processInitialValue:dValue];
    }
    //检查指定键是否有值
    if(self.checkType == JsonParserCheckMustKeyAndValue && !dValue)
    {
        return [NSError errorWithDomain:JsonParserFormat_ErrorDomin code:1 userInfo:@{@"reason":[NSString stringWithFormat:@"指定key:%@的值为空",self.key]}];
    }
    *value = dValue;
    return nil;
}

- (NSError *)parseDic:(NSDictionary *)dic forModel:(id)model
{
    id value;
    NSError *error = [self parseDic:dic getValue:&value];
    if(!error && value && model && self.modelKeyPath && ![self.modelKeyPath isEqualToString:@""])
    {
        [model setValue:value forKeyPath:self.modelKeyPath];
    }
    return error;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (void)setNilValueForKey:(NSString *)key
{
    
}

@end
