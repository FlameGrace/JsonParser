//
//  JsonParseTool.m
//  flamegrace@hotmail.com
//
//  Created by Flame Grace on 2017/6/14.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParseTool.h"

@implementation JsonParseTool



+ (NSString *)stringFromValue:(id)value
{
    if(value&&[value isKindOfClass:[NSString class]])
    {
        return value;
    }
    return nil;
}


+ (NSNumber *)numberFromValue:(id)value
{
    if(value&&[value isKindOfClass:[NSNumber class]])
    {
        return value;
    }
    return nil;
}

+ (NSDictionary *)dicFromValue:(id)value
{
    if(value&&[value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

+ (NSArray *)arrayFromValue:(id)value
{
    if(value&&[value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

+ (BOOL)isDictionary:(id)jsonDic
{
    if(!jsonDic)
    {
        return YES;
    }
    if(jsonDic&&[jsonDic isKindOfClass:[NSDictionary class]])
    {
        return YES;
    }
    return NO;
}

+ (BOOL)hasKey:(NSString *)key inDic:(NSDictionary *)dic
{
    if(!key)return NO;
    if(dic[key])
    {
        return YES;
    }
    return NO;
}

+ (NSDictionary *)dicForJson:(id)json
{
    if(!json)
    {
        return nil;
    }
    if([json isKindOfClass:[NSDictionary class]])
    {
        return json;
    }
    if([json isKindOfClass:[NSString class]])
    {
        json = (NSString *)json;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
        return dic;
    }
    if([json isKindOfClass:[NSData class]])
    {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:nil];
        return dic;
    }
    return nil;
}



@end
