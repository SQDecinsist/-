//
//  SQRowItem.m
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRowItem.h"

@implementation SQRowItem
+ (instancetype)rowItemWithImage:(UIImage *)image title:(NSString *)title{
    SQRowItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}
@end
