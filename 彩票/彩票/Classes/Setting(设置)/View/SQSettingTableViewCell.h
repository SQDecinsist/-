//
//  SQSettingTableViewCell.h
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SQRowItem;
@interface SQSettingTableViewCell : UITableViewCell
/** 模型数据*/
@property (strong, nonatomic) SQRowItem *rowItem;

+ (instancetype)cellWithTableView:(UITableView *)tableView Style:(UITableViewCellStyle)style;
@end
