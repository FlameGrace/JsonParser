//
//  JsonParseTool.h
//  flamegrace@hotmail.com
//
//  Created by Flame Grace on 2017/6/14.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//  主要用于服务器等返回的json字典数据解析

#import <Foundation/Foundation.h>


@interface JsonParseTool : NSObject


/**
 检验value是否是NSArray类型
 @param value id类型，类型不定
 @return 是数组类型则返回，不是则返回nil
 */
+ (NSArray *)arrayFromValue:(id)value;
/**
 检验value是否是NSDictionary类型
 @param value id类型，类型不定
 @return 是字典类型则返回，不是则返回nil
 */
+ (NSDictionary *)dicFromValue:(id)value;
/**
 检验value是否是NSString类型
 @param value id类型，类型不定
 @return 是NSString类型则返回，不是则返回nil
 */
+ (NSString *)stringFromValue:(id)value;
/**
 检验value是否是NSNumber类型
 @param value id类型，类型不定
 @return 是NSNumber类型则返回，不是则返回nil
 */
+ (NSNumber *)numberFromValue:(id)value;
/**
 将给定id类型json转换成NSDictionary数据返回
 @param json id类型，类型不定，若为NSData,NSString或NSDictionry则转换为NSDictionary后返回，转换失败返回nil
 @return 转换后的数据
 */
+ (NSDictionary *)dicForJson:(id)json;
/**
 检验字典中是否有特定键key
  @param key 特定键名
  @param dic
 @return 检查结果
 */
+ (BOOL)hasKey:(NSString *)key inDic:(NSDictionary *)dic;

@end
