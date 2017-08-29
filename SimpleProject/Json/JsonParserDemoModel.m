//
//  JsonParserDemoModel.m
//  Json
//
//  Created by 李嘉军 on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "JsonParserDemoModel.h"
#import "JsonParser.h"
#import "JsonParserStringValue.h"
#import "JsonParserNumberValue.h"
#import "JsonParserDicValue.h"
#import "JsonParserArrayValue.h"
#import "JsonParserStringNumberBoolValue.h"
#import "JsonParserStringIntergeValue.h"
#import "JsonParserStringBooleanBoolValue.h"

@implementation JsonParserDemoModel

+ (instancetype)modelByData:(id)data
{
    NSDictionary *dic = [JsonParseTool dicForJson:data];
    NSArray *formatsDicArray = @[
                                 @{
                                     JsonParserFormat_Key:@"name"
                                     },
                                 @{
                                     JsonParserFormat_Key:@"height",
                                     JsonParserFormat_ValueProcess:[JsonParserStringIntergeValue model]
                                     },
                                 @{
                                     JsonParserFormat_Key:@"is_synced",
                                     JsonParserFormat_ModelKeyPath:@"isSynced",
                                     JsonParserFormat_ValueProcess:[JsonParserStringNumberBoolValue model]
                                     },
                                 @{
                                     JsonParserFormat_Key:@"pet",
                                     JsonParserFormat_ModelKeyPath:@"", //不保存值
                                     JsonParserFormat_ValueProcess:[JsonParserDicValue model]
                                     },
                                 @{
                                     JsonParserFormat_Key:@"have_pet",
                                     JsonParserFormat_ModelKeyPath:@"havePet",
                                     JsonParserFormat_ValueProcess:[JsonParserStringBooleanBoolValue model],
                                     JsonParserFormat_Dic:dic[@"pet"],
                                     },
                                 @{
                                     JsonParserFormat_Key:@"pets",
                                     JsonParserFormat_ValueProcess:[JsonParserArrayValue model],
                                     JsonParserFormat_Dic:dic[@"pet"],
                                     },
                                 ];
    
    JsonParserDemoModel *model = [[JsonParserDemoModel alloc]init];
    NSError *error = [JsonParser parserJson:dic forModel:model withFormatDicArray:formatsDicArray];
    if(error)
    {
        return nil;
    }
    model.petNumber = [NSNumber numberWithInteger:model.pets.count];
    return model;

}

@end
