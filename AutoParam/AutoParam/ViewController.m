//
//  ViewController.m
//  AutoParam
//
//  Created by hador on 16/5/6.
//  Copyright © 2016年 hador. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"


@interface ViewController ()
/**字典*/
@property (nonatomic, strong) NSDictionary *modelDict;

@end

@implementation ViewController
/**
 *  懒加载plist文件
 *
 *  @return 返回一个地字典
 */
- (NSDictionary *)modelDict {
    
    if (!_modelDict) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        self.modelDict = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return _modelDict;
    
}
/**
 *  KVC:去字典中遍历所有的key，保存到模型中
 *  runtime:根据模型中的属性，去字典中找对应的key，保存到模型
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //通过传入字典，在控制台输出属性定义过程
    [NSObject createPropertyCodeWithDict:self.modelDict];
    
    //数组内部属性解析
//    NSArray *modelArray = self.modelDict[@"friends"];
//    [NSObject createPropertyCodeWithDict:modelArray[0]];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
