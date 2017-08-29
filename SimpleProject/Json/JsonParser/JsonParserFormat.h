//
//  JsonParserFormat.h
//  flamegrace@hotmail.com
//
//  Created by Flame Grace on 2017/6/14.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//  字典解析规则，主要针对单层字典的某个键的解析规则，参见JsonParser

#import <Foundation/Foundation.h>
#import "JsonParseTool.h"
#import "JsonParserValueProcessProtocol.h"
#import "JsonParserStringValue.h"

#define  JsonParserFormat_ErrorDomin (@"com.flamegrace@hotmail.com.JsonParserFormat")

#define JsonParserFormat_Key (@"key")
#define JsonParserFormat_ModelKeyPath (@"modelKeyPath")
#define JsonParserFormat_CheckType (@"checkType")
#define JsonParserFormat_ValueProcess (@"valueProcess")
#define JsonParserFormat_Dic (@"dic")

typedef NS_ENUM(NSInteger, JsonParserCheckType){
    JsonParserCheckNothing = 0, //
    JsonParserCheckMustKey,
    JsonParserCheckMustKeyAndValue,
};


@interface JsonParserFormat : NSObject

@property (strong, nonatomic) NSString *key; //字典的键名
@property (strong, nonatomic) NSString *modelKeyPath; //要解析的模型类的keyPath，必须真实存在
@property (assign, nonatomic) JsonParserCheckType checkType; //检查类型,默认为JsonParserCheckMustKeyAndValue
@property (strong, nonatomic) id <JsonParserValueProcessProtocol> valueProcess; //值转换格式，默认为JsonParserStringValue
@property (assign, nonatomic) NSDictionary *dic;//若不希望使用外部dic可设置此属性，则采用此dic解析

+ (instancetype)format;

+ (instancetype)formatWithKey:(NSString *)key modelKeyPath:(NSString *)modelKeyPath;
+ (instancetype)formatWithKey:(NSString *)key modelKeyPath:(NSString *)modelKeyPath valueProcess:(Class <JsonParserValueProcessProtocol>)valueProcess;

/**
 针对此规则解析字典的特定键，并将值赋值给model

 @param dic 字典
 @param model 将解析获取的值赋给model，仅当值和model不为nil且给出self.modelKeyPath的时候才会赋值操作,self.modelKeyPath = @""时也不进行赋值操作
 @return 返回是否通过规则验证
 */
- (NSError *)parseDic:(NSDictionary *)dic forModel:(id)model;

/**
 针对此规则解析字典的特定键，并获取值

 @param dic 字典
 @param value 传递获取值的地址
 @return 返回是否通过规则验证
 */
- (NSError *)parseDic:(NSDictionary *)dic getValue:(id *)value;



/**
 根据约定规则字典生成规则数组

 @param formatDic 约定格式的规则字典，例如以下格式
    @{JsonParserFormat_Key:@"air_state",JsonParserFormat_ValueType:@(JsonParserStringBoolValue)},
    @{JsonParserFormat_Key:@"car_temperature"},
    @{JsonParserFormat_Key:@"remain_mileage",JsonParserFormat_MustKey:@(NO)},
    必须有的键为@"key"，如果不设置@"modelKeyPath"则默认modelKeyPath=key;
    其他键不设置则为默认值
 @return 规则
 */
+ (JsonParserFormat *)formatFromFormatDic:(NSDictionary *)formatDic;

/**
 根据规则字典数组生成规则数组
 @param formatDicArray 规则字典数组,数组类似
        NSArray *formatsDicArray = @[
                    @{JsonParserFormat_Key:@"air_state",JsonParserFormat_ValueType:@(JsonParserStringBoolValue)},
                    @{JsonParserFormat_Key:@"car_temperature"},
                    @{JsonParserFormat_Key:@"remain_mileage",JsonParserFormat_MustKey:@(NO)},
        ];
        必须有的键为@"key"，如果不设置@"modelKeyPath"则默认modelKeyPath=key;
        若不需要赋值操作，则可以设置JsonParserFormat_ModelKeyPath:@""
        其他键不设置则为默认值
 @return 规则数组
 */

+ (NSArray <JsonParserFormat *> *)formatsFromFormatDicArray:(NSArray <NSDictionary *> *)formatDicArray;

@end
