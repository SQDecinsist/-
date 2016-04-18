//
//  SQArenaNavigationController.m
//  彩票
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQArenaNavigationController.h"

@implementation SQArenaNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
}

+ (void)initialize{
    //找到bar
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    [bar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];   //其他状态是什么时候用的,比如UIBarMetricsCompact
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:20.0]};
    [bar setTitleTextAttributes:dict];
}

@end
