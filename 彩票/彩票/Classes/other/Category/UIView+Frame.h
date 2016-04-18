//
//  UIView+Frame.h
//  彩票
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
//常规的不能再分类里添加属性, 要添加属性的话必须重写setter,getter方法
//在分类中添加的属性会生成setter, getter方法, 当不会生成带_的成员变量

/** 坐标x*/
@property (assign, nonatomic) CGFloat x;
/** 坐标y*/
@property (assign, nonatomic) CGFloat y;
/** 尺寸w*/
@property (assign, nonatomic) CGFloat w;
/** 尺寸h*/
@property (assign, nonatomic) CGFloat h;


@end
