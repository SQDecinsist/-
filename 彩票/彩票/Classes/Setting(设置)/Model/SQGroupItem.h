//
//  SQGroupItem.h
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQGroupItem : NSObject
/** 头部标题*/
@property (copy, nonatomic) NSString *headerTitle;
/** 尾部标题*/
@property (copy, nonatomic) NSString *footerTitle;

/** 每行模型数组*/
@property (strong, nonatomic) NSArray *rowItemArr;

+ (instancetype)groupWithRowItemArr:(NSArray *)rowItemArr;

@end
