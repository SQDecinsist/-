//
//  SQConverView.m
//  彩票
//
//  Created by Mac on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQConverView.h"

@implementation SQConverView

+ (void)show{
    SQConverView *converV = [[SQConverView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    converV.backgroundColor = [UIColor blackColor];
    converV.alpha = 0.6;
    [[UIApplication sharedApplication].keyWindow addSubview:converV];
}
@end
