//
//  JsonParserDemoModel.h
//  Json
//
//  Created by Flame Grace on 2017/8/29.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParserDataModeProtocol.h"

//  @{
//    @"name":@"ll",
//    @"height":@"100",
//    @"is_synced":@"1",
//    @"pet":@{
//            @"have_pet":@"true",
//            @"pets":@[1,2,3],
//            },
//    }

@interface JsonParserDemoModel : NSObject <ParserDataModeProtocol>

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger height;
@property (assign, nonatomic) BOOL isSynced;
@property (assign, nonatomic) BOOL havePet;
@property (assign, nonatomic) NSNumber *petNumber;
@property (assign, nonatomic) NSArray *pets;


@end
