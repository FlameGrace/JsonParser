//
//  JsonValueProcessProtocol.h
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonParseTool.h"

@protocol JsonParserValueProcessProtocol <NSObject>

+ (instancetype)model;
//处理初始值
- (id)processInitialValue:(id)value;

@end
