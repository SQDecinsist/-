//
//  SQsaveTool.h
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQsaveTool : NSObject
/** 根据key从偏好设置中读取数据*/
+ (id)objectForKey:(NSString *)key;

/** 根据key把指定对象存储到偏好设置中*/
+ (void)setObject:(id)object ForKey:(NSString *)key;
@end
