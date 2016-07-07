//
//  NSObject+Property.h
//  AutoParam
//
//  Created by hador on 16/5/6.
//  Copyright © 2016年 hador. All rights reserved.
//  通过解析字典生成属性代码

#import <Foundation/Foundation.h>

@interface NSObject (Property)

+ (NSString *)createPropertyCodeWithDict: (NSDictionary *)dict;

@end
