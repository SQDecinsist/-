//
//  UIView+Frame.m
//  彩票
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
/** 坐标x*/
- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

/** 坐标y*/
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

/** 尺寸w*/
- (CGFloat)w{
    return self.frame.size.width;
}
- (void)setW:(CGFloat)w{
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

/** 尺寸h*/
- (CGFloat)h{
    return self.frame.size.height;
}
- (void)setH:(CGFloat)h{
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}


@end
