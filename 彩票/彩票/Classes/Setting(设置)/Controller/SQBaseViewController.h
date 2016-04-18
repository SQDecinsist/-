//
//  SQBaseViewController.h
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SQRowItem.h"
#import "SQGroupItem.h"
#import "SQSection1PushViewController.h"
#import "SQSection2ViewController.h"

#import "MBProgressHUD+XMG.h"

#import "SQArrowItem.h"
#import "SQSwitchItem.h"

#import "SQSettingTableViewCell.h"

@interface SQBaseViewController : UITableViewController
/** 组模型*/
@property (strong, nonatomic) NSMutableArray *groupArrM;
@end
