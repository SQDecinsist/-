//
//  SQsaveTool.m
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQsaveTool.h"

@implementation SQsaveTool
/** 根据key从偏好设置中读取数据*/
+ (id)objectForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

/** 根据key把指定对象存储到偏好设置中*/
+ (void)setObject:(id)object ForKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}
@end
