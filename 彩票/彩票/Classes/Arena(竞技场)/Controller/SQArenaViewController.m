//
//  SQArenaViewController.m
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQArenaViewController.h"

@implementation SQArenaViewController

- (void)loadView{
    UIImageView *BgImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ArenaBackground"]];
    //设置图片为背景时,为不可交互的
    BgImageV.userInteractionEnabled = YES;
    self.view = BgImageV;
}

- (void)viewDidLoad{
    
    UISegmentedControl *segC = [[UISegmentedControl alloc] initWithItems:@[@"篮球",@"足球"]];
    segC.selectedSegmentIndex = 0;
    
//    [segC setTintColor:[UIColor whiteColor]];
    
    //设置默认,以及选中背景
    [segC setBackgroundImage:[UIImage imageNamed:@"ArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segC setBackgroundImage:[UIImage imageNamed:@"ArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    //设置选中时文字颜色
    NSMutableDictionary *dict =[NSMutableDictionary dictionary];
//    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20.0];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [segC setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    //设置文字的颜色
    [segC setTintColor:[UIColor colorWithRed:0/255.0  green:158/255.0 blue:160/255.0 alpha:1]];
    
    self.navigationItem.titleView = segC;
    
    
    
}


@end
