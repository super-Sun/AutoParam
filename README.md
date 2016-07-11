# AutoParam
通过JSON数据，自动转化成OC属性，并且在控制台输出。
根据实际开发中花费大量时间做枯燥乏味且无技术含量的属性定义过程，实在不忍，因此试着用runtime写了一个demo，一行代码解决过去困扰。

#使用方法
//通过传入字典，在控制台输出属性定义过程.

    1.  将NSObject+Property.h、NSObject+Property.m，拷贝到项目中，导入头文件 #import "NSObject+Property.h"
    
    2.  直接调用：[NSObject createPropertyCodeWithDict:YourDict];
    
    3.控制台输出：
    2015-07-06 16:06:38.724 AutoParam[2290:60710] 
    字典中属性转代码：
    
    @property (nonatomic, strong) NSDictionary *friend;

    @property (nonatomic, strong) NSArray *friends;

    @property (nonatomic, assign) int online;

    @property (nonatomic, copy) NSString *name;

    @property (nonatomic, assign) BOOL isVIP;
    
    4.将控制台 输出内容 拷贝到对应 模型文件。
#效果演示  
![image](https://github.com/super-Sun/AutoParam/blob/master/gif/param.gif)
    
