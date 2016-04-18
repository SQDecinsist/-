//
//  SQSection1PushViewController.m
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQSection1PushViewController.h"

#import "SQArrowItem.h"
#import "SQSwitchItem.h"
#import "SQGroupItem.h"
#import "SQRowItem.h"

#import "SQSettingTableViewCell.h"
#import "SQSection1-1ViewController.h"
#import "SQScoreLineViewController.h"

@interface SQSection1PushViewController ()
/** 组模型*/
@property (strong, nonatomic) NSMutableArray *groupArrM;

@end

@implementation SQSection1PushViewController

- (NSMutableArray *)groupArrM{
    if (!_groupArrM) {
        self.groupArrM = [NSMutableArray array];
    }
    return _groupArrM;
}

//为什么可以不用判断是否初始化成功 if( self = [super init])
- (instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"使用兑换码";
    
    [self setUpGroup0];

    
    
}

- (void)setUpGroup0{
    SQArrowItem *item0 = [SQArrowItem rowItemWithImage:[UIImage imageNamed:@"handShake"] title:@"开奖推送"];
    //设置要跳转的控制器
    item0.desClass = [SQSection1_1ViewController class];
    
    SQArrowItem *item1 = [SQArrowItem rowItemWithImage:[UIImage imageNamed:@"lamp"] title:@"比分直播"];
    item1.desClass = [SQScoreLineViewController class];
    
    SQArrowItem *item2 = [SQArrowItem rowItemWithImage:[UIImage imageNamed:@"lamp"] title:@"比分直播"];
    
    
    SQArrowItem *item3 = [SQArrowItem rowItemWithImage:[UIImage imageNamed:@"lamp"] title:@"比分直播"];
    
    
    NSArray *arr = @[item0, item1, item2, item3];
    
    SQGroupItem *groupItem0 = [SQGroupItem groupWithRowItemArr:arr];
    groupItem0.headerTitle = @"第一组头部标题";
    groupItem0.footerTitle = @"第一组尾部标题";
    
    [self.groupArrM addObject:groupItem0];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groupArrM.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SQGroupItem *groupItem = self.groupArrM[section];
    
    return groupItem.rowItemArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    static NSString *ID = @"settingCell";
    
    
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];      //为什么会崩
    
    
    
    SQSettingTableViewCell *cell = [SQSettingTableViewCell cellWithTableView:tableView Style:UITableViewCellStyleValue1];
    
    
    
    //    SQSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //    if (!cell) {
    //        cell = [[SQSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    //    }
    
    
    
    //取出模型
    SQGroupItem *groupItem = self.groupArrM[indexPath.section];
    SQRowItem *rowItem = groupItem.rowItemArr[indexPath.row];
    
    
    //    cell.textLabel.text = rowItem.title;
    //    cell.imageView.image = rowItem.image;
    //
    //    if ([rowItem isKindOfClass:[SQArrowItem class]]) {
    //        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    //    }else if ([rowItem isKindOfClass:[SQSwitchItem class]]){
    //        cell.accessoryView = [[UISwitch alloc] init];
    //    }else{
    //        cell.accessoryView = nil;
    //    }
    
    
#pragma mark - 控制器里写太多的cell内部的细节,可以抽离出来,自定义一个cell
    
    cell.rowItem = rowItem;
    
    return cell;
}

//选中某一行的时候,调转控制器
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SQGroupItem *groupItem = self.groupArrM[indexPath.section];
    SQRowItem *rowItem = groupItem.rowItemArr[indexPath.row];
    
    
    //判断一下模型的类型
    if ([rowItem isKindOfClass:[SQArrowItem class]]) {
        SQArrowItem *arrowItem = (SQArrowItem *)rowItem;
        
        //放在前面,先看有没有任务,在看看有没有跳转的控制器
        if (arrowItem.operationTask) {
            arrowItem.operationTask();
        }
        
        if (arrowItem.desClass) {
            [self.navigationController pushViewController:[[arrowItem.desClass alloc] init] animated:YES];
        }
    }
    
    
    
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    SQGroupItem *groupItem = self.groupArrM[section];
    return groupItem.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    SQGroupItem *groupItem = self.groupArrM[section];
    
    return groupItem.footerTitle;
    
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
