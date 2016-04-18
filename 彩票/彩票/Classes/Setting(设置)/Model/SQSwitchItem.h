//
//  SQSwitchItem.h
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQRowItem.h"

@interface SQSwitchItem : SQRowItem
//当前开关状态
@property (nonatomic, assign, getter = isSwitchOn) BOOL  switchON;
@end
