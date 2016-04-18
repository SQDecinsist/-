//
//  SQArrowItem.h
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRowItem.h"

@interface SQArrowItem : SQRowItem
/** 设置要跳转的控制器的名称*/
@property (assign, nonatomic) Class desClass;

/** 要执行的某段代码*/
@property (copy, nonatomic)  void(^operationTask)();
@end
