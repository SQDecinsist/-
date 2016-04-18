//
//  SQHallTableViewController.m
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQHallTableViewController.h"
#import "SQConverView.h"
#import "SQPopView.h"

@interface SQHallTableViewController ()<SQPopViewDelegate>

@end

@implementation SQHallTableViewController

//设置左边右边的按钮, 用navigationItem,选择leftBarButtonItem

#pragma mark - //为什么要使用 viewDidAppear:
- (void)viewDidAppear:(BOOL)animated{
    //图片添加到navigationItem时会被渲染,可通过imageWithRenderingMode:处理,这里是创建了个image的分类
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderImageName:@"Nav_activity_image"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarClick)];
}

- (void)leftBarClick{
    //如果点击了leftBarbtn,就调用show展示遮盖,
    [SQConverView show];
    
    //展示活动图到摸个位置        //为了能够移植,选择创建类自定义控件方式
    SQPopView *popView = [SQPopView showWithPoint:self.view.center];
    popView.delegate = self;
}

#pragma mark - SQPopViewDelegate
- (void)popViewDidClickCloseBtn:(SQPopView *)popView{
//    [popView removeFromSuperview];
    [popView hideInPoint:CGPointMake(20, 40) completion:^{
        for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
            if ([view isKindOfClass:[SQConverView class]]) {
                [view removeFromSuperview];
            }
        }
    }];
    
}


//自定义类SQConverView
/*
+ (void)show{
    UIView *converV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    converV.backgroundColor = [UIColor blackColor];
    converV.alpha = 0.6;
    [[UIApplication sharedApplication].keyWindow addSubview:converV];
}
 */

@end
