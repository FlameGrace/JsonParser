//
//  ParseDataModeProtocol.h
//  flamegrace@hotmail.com
//
//  Created by Flame Grace on 2017/2/13.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonParser.h"

@protocol ParserDataModeProtocol <NSObject>

/**
 将回复数据转换为对象
 @param data 回复的数据
 @return nil表示转换失败回复数据格式出错，不为nil则表示转换成功
 */
+ (instancetype)modelByData:(id)data;


@end
