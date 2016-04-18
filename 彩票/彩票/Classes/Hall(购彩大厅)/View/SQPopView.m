//
//  SQPopView.m
//  彩票
//
//  Created by Mac on 16/3/27.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQPopView.h"
#import "SQConverView.h"

@implementation SQPopView

+ (instancetype)showWithPoint:(CGPoint)point{
    SQPopView *popV = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
    popV.center = point;
    [[UIApplication sharedApplication].keyWindow addSubview:popV];
    return popV;
}

//点击按钮,让控制器关闭
- (IBAction)clickCloseBtn{
    if ([self.delegate respondsToSelector:@selector(popViewDidClickCloseBtn:)]) {
        [self.delegate popViewDidClickCloseBtn:self];
    }
    
    
//可以直接移除SQConverView类型的view
//    [self removeFromSuperview];
//    
//    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
//        if ([view isKindOfClass:[SQConverView class]]) {
//            [view removeFromSuperview];
//        }
//    }
    
}

- (void)hideInPoint:(CGPoint)point completion:(void(^)())completion{
    [UIView animateWithDuration:0.5 animations:^{
        self.center = point;
        self.transform = CGAffineTransformMakeScale(0.001, 0.001);
    } completion:^(BOOL finished) {
        //动画完成后移除self
        [self removeFromSuperview];
        completion();
    }];
    
}

@end
