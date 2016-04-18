//
//  SQSettingTableViewCell.m
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQSettingTableViewCell.h"
#import "SQRowItem.h"
#import "SQSwitchItem.h"
#import "SQArrowItem.h"

@implementation SQSettingTableViewCell
/** 创建cell*/
+ (instancetype)cellWithTableView:(UITableView *)tableView Style:(UITableViewCellStyle)style{
    static NSString *ID = @"settingCell";
    SQSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}



/** 设置模型*/
- (void)setRowItem:(SQRowItem *)rowItem{
    _rowItem = rowItem;
    
    /** 设置数据*/
    [self setUpData:rowItem];
    
    /** 设置cell辅助视图*/
    [self setUpAccessory:rowItem];
    
}

/** 设置数据*/
- (void)setUpData:(SQRowItem *)rowItem{
    self.textLabel.text = rowItem.title;
    self.imageView.image = rowItem.image;
    self.detailTextLabel.text = rowItem.detailText;
}


/** 设置cell辅助视图*/
- (void)setUpAccessory:(SQRowItem *)rowItem{
    if ([rowItem isKindOfClass:[SQArrowItem class]]) {
        
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        
    }else if ([rowItem isKindOfClass:[SQSwitchItem class]]){
        
        UISwitch *swi = [[UISwitch alloc] init];
        self.accessoryView = swi;
        SQSwitchItem *switchItem = (SQSwitchItem *)rowItem;
        swi.on = switchItem.isSwitchOn;     //没有效果
        
        
    }else{
        
        self.accessoryView = nil;
        
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
