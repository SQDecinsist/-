//
//  SQTabBarController.m
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTabBarController.h"

#import "SQArenaViewController.h"
#import "SQDiscoverTableViewController.h"
#import "SQHallTableViewController.h"
#import "SQHistoryTableViewController.h"
#import "SQMylotteryViewController.h"

#import "SQTabBarView.h"
#import "SQNavigationController.h"
#import "SQArenaNavigationController.h"

@interface SQTabBarController ()<SQTabBarViewDelegate>
/** <#说明#>*/
@property (strong, nonatomic) NSMutableArray *itemArrM;
@end
@implementation SQTabBarController
- (NSMutableArray *)itemArrM{
    if (!_itemArrM) {
        _itemArrM = [NSMutableArray array];
    }
    return _itemArrM;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    //添加子控制器
    [self addAllChildController];
    
    //思路: 系统的tabBar不能满足项目要求,重新用View来定义tabBar,view里面定义五个按钮, 当点击按钮时, 调用与按钮标识tag相关联的viewController
    //移除tabBar(只是从view中移除,并没有从控制器中移除,还可以用它的尺寸等信息)
//    [self.tabBar removeFromSuperview];        //把自定义view放在tabBar,随着tabBar显示和隐藏
    
    //设置自定义的tabbar
    SQTabBarView *tabBarV = [[SQTabBarView alloc] initWithFrame:self.tabBar.bounds];
    
    //block切换tabBar     //必须在tabBarV.itemArrM = self.itemArrM;之前定义,因为在tabBarV.itemArrM = self.itemArrM;执行了block;
    tabBarV.myBlock = ^(NSInteger index){
        self.selectedIndex = index;
    };
    
    tabBarV.itemArrM = self.itemArrM;
    [self.tabBar addSubview:tabBarV];
    
    //设置tabBarV的delegate
    tabBarV.delegate = self; 
    
}

//在tabBar即将现世的时候,把移除tabBarButton
- (void)viewWillAppear:(BOOL)animated{
    //显示前
//    NSLog(@"%@",self.tabBar.subviews);
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        //由于敲不出来UITabBarButton, 反过来删除
        if (![view isKindOfClass:[SQTabBarView class]]) {
            [view removeFromSuperview];
        }
    }
    
    
}

#pragma mark - SQTabBarViewDelegate方法
- (void)tabBarViewClickTabBar:(SQTabBarView *)tabBarView selectedIndex:(NSInteger)index{
    self.selectedIndex = index;
}

- (void)addAllChildController{
    //添加子控制器
    //购彩大厅
    SQHallTableViewController *hallVC = [[SQHallTableViewController alloc] init];
    hallVC.view.backgroundColor = [UIColor redColor];
//    UIImage *image = [UIImage imageNamed:@"TabBar_LotteryHall_new"];
//    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self viewController:hallVC title:@"购彩大厅" image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selectedImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"]];
    
    
    //竞技场
    SQArenaViewController *arenaVC = [[SQArenaViewController alloc] init];
    arenaVC.view.backgroundColor = [UIColor blueColor];
    [self viewController:arenaVC title:@"竞技场" image:[UIImage imageNamed:@"TabBar_Arena_new"] selectedImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"]];
    
    
    //发现
//    SQDiscoverTableViewController *disVC = [[SQDiscoverTableViewController alloc] init];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Discovery" bundle:nil];   //写Storyboard的文件名
    SQDiscoverTableViewController *disVC = [sb instantiateInitialViewController];
    [self viewController:disVC title:@"发现" image:[UIImage imageNamed:@"TabBar_Discovery_new"] selectedImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"]];
    
    //开奖信息
    SQHistoryTableViewController *hisVC = [[SQHistoryTableViewController alloc] init];
    hisVC.view.backgroundColor = [UIColor yellowColor];
    [self viewController:hisVC title:@"开奖信息" image:[UIImage imageNamed:@"TabBar_History_new"] selectedImage:[UIImage imageNamed:@"TabBar_History_selected_new"]];
    
    //我的彩票
    SQMylotteryViewController *myLotVC = [[SQMylotteryViewController alloc] init];
    myLotVC.view.backgroundColor = [UIColor purpleColor];
    [self viewController:myLotVC title:@"我的彩票" image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selectedImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"]];
}

- (void)viewController:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selImage{
    
    //设置导航控制器根控制器的标题
//    vc.title  = title;
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    
    //保存当前tabBarItem模型
    [self.itemArrM addObject:vc.tabBarItem];
    
    if ([vc isKindOfClass:[SQArenaViewController class]]) {
        SQArenaNavigationController *nav = [[SQArenaNavigationController alloc] initWithRootViewController:vc];
        
        [self addChildViewController:nav];
    }else{
        SQNavigationController *nav = [[SQNavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
    
/*
    //设置导航条的背景图片,标题文字大小     //navigation内部的事情应该放到它内部取做
    nav.navigationBar.backgroundColor = [UIColor redColor]; //为什么设置背景颜色没用?????
//    nav.navigationBar.backIndicatorImage = [UIImage imageNamed:@"NLArenaNavBar64"];//没有forBarMetrics:也不行??
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];   //其他状态是什么时候用的,比如UIBarMetricsCompact
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:20.0]};
    [nav.navigationBar setTitleTextAttributes:dict];
*/
 
    
    
}

@end
