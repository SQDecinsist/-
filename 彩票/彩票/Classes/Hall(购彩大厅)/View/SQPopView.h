//
//  SQPopView.h
//  彩票
//
//  Created by Mac on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SQPopView;
@protocol SQPopViewDelegate <NSObject>

- (void)popViewDidClickCloseBtn:(SQPopView *)popView;

@end

@interface SQPopView : UIView
/** 展示到摸个位置*/
+ (instancetype)showWithPoint:(CGPoint)point;
/** 隐藏到摸个位置*/
- (void)hideInPoint:(CGPoint)point completion:(void(^)())completion;
/** SQPopViewDelegate*/
@property (weak, nonatomic) id<SQPopViewDelegate> delegate;

@end
