//
//  SQBuyViewController.m
//  彩票
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQBuyViewController.h"
#import "SQDisNavTitleBtn.h"
@interface SQBuyViewController ()

@end

@implementation SQBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SQDisNavTitleBtn *btn = [SQDisNavTitleBtn buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageWithRenderImageName:@"DownArrow"] forState:UIControlStateNormal];
    
    //一定要写上sizeToFit
    [btn sizeToFit];
    
    self.navigationItem.titleView = btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 \0'\''''''''''''''''''''''
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
