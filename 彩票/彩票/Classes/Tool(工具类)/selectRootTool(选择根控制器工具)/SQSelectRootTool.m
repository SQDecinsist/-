//
//  SQSelectRootTool.m
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQSelectRootTool.h"
#import "SQsaveTool.h"
#import "SQNewFeatureViewController.h"
#import "SQTabBarController.h"

#define SQVersion @"curVersion"

@implementation SQSelectRootTool
/** 选择根控制器*/
+ (UIViewController *)chooseRootVC{
    //设置跟控制器
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *preVersion = [SQsaveTool objectForKey:SQVersion];
    
    
    if ([curVersion isEqualToString:preVersion]) {
        
        SQTabBarController *tabBarVC = [[SQTabBarController alloc] init];
        return tabBarVC;
        
    }else{
        //新特性
        SQNewFeatureViewController *NFVC = [[SQNewFeatureViewController alloc] init];
        NFVC.view.backgroundColor = [UIColor redColor];
        
        //存储当前版本到key-SQVersion中
        [SQsaveTool setObject:curVersion ForKey:SQVersion];
        return NFVC;
    }
    
}
@end
