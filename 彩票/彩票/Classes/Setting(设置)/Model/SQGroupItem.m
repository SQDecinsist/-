//
//  SQGroupItem.m
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQGroupItem.h"
#import "SQRowItem.h"
@implementation SQGroupItem

+ (instancetype)groupWithRowItemArr:(NSArray *)rowItemArr{
    SQGroupItem *groupItem = [[self alloc] init];
    groupItem.rowItemArr = rowItemArr;
    return groupItem;
}

@end
