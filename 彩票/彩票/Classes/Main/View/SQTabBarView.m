//
//  SQTabBarView.m
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTabBarView.h"
#import "SQtabBarBtn.h"



@interface SQTabBarView ()
/** 上一个选中按钮*/
@property (strong, nonatomic) UIButton *preSelectedBtn;

@end
@implementation SQTabBarView

- (void)setItemArrM:(NSMutableArray *)itemArrM{
    _itemArrM = itemArrM;
    //调用setter方法的时候给自定义控件传数据
    //设置数据给button,首先得创建button
    for (int i = 0; i < itemArrM.count; i++) {
        SQtabBarBtn *btn = [SQtabBarBtn buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        //设置图片等信息(设置正常与选中时的背景,而不通过(setImage)设置图片,这种会根据图片自身大小显示,而前一种可以充满整个button)
        UITabBarItem *item = itemArrM[i];
//        [btn setTitle:item.title forState:UIControlStateNormal];  //不用设置
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];    //selected要在选中状态下, addTaget:来监听是否选中,而在UIControlStateHighlighted情况下直接点击时就是高亮
#pragma mark - 取消高亮状态??可行??
        //当点击按钮时,仍然处于高亮状态,必须取消高亮状态???是否有属性可以改
        [btn setHighlighted:NO];
        
//        [btn setImage:item.image forState:UIControlStateNormal];
//        [btn setImage:item.selectedImage forState:UIControlStateHighlighted];
        [self addSubview:btn];
#pragma mark - 按下就显示(细节),如果不按下显示呢???
//        [btn addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchDown];
        if (i == 0) {
            [self tabBarClick:btn];
        }
    }
    
    
}

- (void)tabBarClick:(UIButton *)btn{
    //1.设置上一个选中按钮为取消选中状态
    self.preSelectedBtn.selected = NO;
    //2.设置当前点击的按钮为选中状态
    btn.selected = YES;
    //3.设置当前点击的按钮为上一个选中按钮
    self.preSelectedBtn = btn;
    
    if ([self.delegate respondsToSelector:@selector(tabBarViewClickTabBar:selectedIndex:)]) {
//        [self.delegate tabBarViewClickTabBar:self selectedIndex:btn.tag]; //关闭, 用block来实现
    }
    self.myBlock(btn.tag);
    
}

- (void)layoutSubviews{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.frame.size.width / 5;
    CGFloat h = self.frame.size.height;
#pragma mark - 取出子控件subviews
    //向这种把控件中只有自己所添加的子控件时,直接通过subviews取出来
    for (int i = 0; i < self.subviews.count; i ++) {
        x = i * w;
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, w, h);
    }
    
}

@end
