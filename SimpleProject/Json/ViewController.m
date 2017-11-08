//
//  ViewController.m
//  Json
//
//  Created by Flame Grace on 2017/8/17.
//  Copyright © 2017年 flamegrace@hotmail.com. All rights reserved.
//

#import "ViewController.h"
#import "JsonParserDemoModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dic = @{
                          @"name":@"ll",
                          @"height":@"100",
                          @"is_synced":@"1",
                          @"pet":@{
                                  @"have_pet":@"true",
                                  @"pets":@[@1,@2,@3],
                                  },
                          };
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    JsonParserDemoModel *model = [JsonParserDemoModel modelByData:data];
    NSLog(@"宠物：%@",model.pets);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
