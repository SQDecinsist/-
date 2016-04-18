//
//  SQNavigationController.m
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQNavigationController.h"


@interface SQNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) id interactivePopGesDelegate;
@end

@implementation SQNavigationController
//- (void)loadView{
////    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
//
////设置导航条的背景图片,标题文字大小     //navigation内部的事情应该放到它内部取做
////bar.backgroundColor = [UIColor redColor]; //为什么设置背景颜色没用?????
////    nav.navigationBar.backIndicatorImage = [UIImage imageNamed:@"NLArenaNavBar64"];//没有forBarMetrics:也不行??
//[bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];   //其他状态是什么时候用的,比如UIBarMetricsCompact
//NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:20.0]};
//[bar setTitleTextAttributes:dict];
//}

//第一次使用时
//类方法中不能使用带下划线的属性,以及不能使用点语法,通过apperance
+ (void)initialize{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    //设置导航条的背景图片,标题文字大小     //navigation内部的事情应该放到它内部取做
    //bar.backgroundColor = [UIColor redColor]; //为什么设置背景颜色没用?????
    //    nav.navigationBar.backIndicatorImage = [UIImage imageNamed:@"NLArenaNavBar64"];//没有forBarMetrics:也不行??
    
    //如果设置了导航条背景图片,它所在的控制器的View它的y值为64,如果没有设背景y值为0;
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];   //其他状态是什么时候用的,比如UIBarMetricsCompact
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:20.0]};
    [bar setTitleTextAttributes:dict];
    
    //设置全局的返回按钮类型
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"%ld",self.childViewControllers.count);
    //当等于0是为根控制器
    if (self.childViewControllers.count != 0) {
        
        //回复侧滑功能
        //self.interactivePopGestureRecognizer.delegate = _UINavigationInteractiveTransition
//        NSLog(@"%@",self.interactivePopGestureRecognizer.delegate);
        
        self.interactivePopGestureRecognizer.delegate = nil;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderImageName:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }

    [super pushViewController:viewController animated:animated];
}

- (void)back{
    
    [self popViewControllerAnimated:YES];
//    NSLog(@"%ld",self.childViewControllers.count);
//    if (self.childViewControllers.count == 1) {
//    self.interactivePopGestureRecognizer.delegate = self.interactivePopGesDelegate;
//    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"%ld",self.childViewControllers.count);
    if (self.childViewControllers.count == 1) {
        
        self.interactivePopGestureRecognizer.delegate = self.interactivePopGesDelegate;
    }
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"%@",self.interactivePopGestureRecognizer);
    //<UIScreenEdgePanGestureRecognizer: 0x7fb5c309a320; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fb5c3091bc0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fb5c3091db0>)>>
    //action = handleNavigationTransition:, target = _UINavigationInteractiveTransition
    //UIScreenEdgePanGestureRecognizer : UIPanGestureRecognizer
    
    self.interactivePopGesDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
    //添加手势
    #pragma clang diagnostic ignored "-Wundeclared-selector"
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    //设置手势的代理
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    
}

//在返回的时候,判断当前的控制器是否为根控制器,如果是根控制器,把代理设置回去,
//pop这个方法有点问题,当拖到一半又放回去的时候,就不灵了

//- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
//    NSLog(@"%ld",self.childViewControllers.count);
//    if (self.childViewControllers.count == 2) {
//        self.interactivePopGestureRecognizer.delegate = self.interactivePopGesDelegate;
//    }
//    return [super popViewControllerAnimated:animated];
//}

//不实现该方法,在根控制器左划也会出现假死
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count != 1;
}

@end
