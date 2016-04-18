//
//  SQMylotteryViewController.m
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQMylotteryViewController.h"
#import "SQSettingViewController.h"


@interface SQMylotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation SQMylotteryViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    UIImage *image = self.loginBtn.currentBackgroundImage;      //怎么获取高亮时候的图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
    //设置
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderImageName:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(enterSetting)];
    
    //设置左边BarButtonItem
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"Mylottery_Barbutton"] forState:UIControlStateNormal];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    [btn sizeToFit];  //不设置会看不见图标
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:@selector(talk) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)enterSetting{
    NSLog(@"进入设置");
    SQSettingViewController *settingVC = [[SQSettingViewController alloc] init];
    settingVC.view.backgroundColor = [UIColor yellowColor];
    
//    NSLog(@"my----%@----%@",settingVC.view,settingVC.tableView);
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)talk{
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:@"tel://10086"]];
}

@end
