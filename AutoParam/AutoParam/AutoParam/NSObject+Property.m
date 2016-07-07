//
//  NSObject+Property.m
//  AutoParam
//
//  Created by hador on 16/5/6.
//  Copyright © 2016年 hador. All rights reserved.
//  通过解析字典生成属性代码

#import "NSObject+Property.h"

@implementation NSObject (Property)
/**在这里传入一个字典或者服务器返回的JSON数据*/
+ (NSString *)createPropertyCodeWithDict:(NSDictionary *)dict {
    //待会儿要生成这样格式的字符串：@property (nonatomic, strong) NSDictionary *modelDict;
    //字符串内部 变量：strong nsdictionary modelDict
    NSMutableString *muStr = [[NSMutableString alloc] init];
    [muStr appendFormat:@"\n字典中属性转代码："];
    //遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull proprtyName, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //这个日志用来查看类型，为了不影响查看输出把它注释
//        NSLog(@"type:%@", [obj class]);
        
        /** 最终的字符串*/
        NSString *code = nil;
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@", proprtyName];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")] || [obj isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@", proprtyName];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@", proprtyName];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@", proprtyName];
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@", proprtyName];
        }//...在此处可以补充更多类型的转化
        
        [muStr appendFormat:@"\n%@;\n",code ];

    }];
    
    NSLog(@"%@\n---------------------------------------------\n",muStr);
    
    return nil;
}

@end
