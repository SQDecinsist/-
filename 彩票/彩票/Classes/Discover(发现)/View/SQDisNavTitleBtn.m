//
//  SQDisNavTitleBtn.m
//  彩票
//
//  Created by Mac on 16/3/28.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQDisNavTitleBtn.h"

@implementation SQDisNavTitleBtn

- (void)layoutSubviews{
    [super layoutSubviews];
//    self.titleLabel.x = 0;
//    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    
    //layoutSubviews会被执行两次
    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
    
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    //当设置标题时(标题长度未知),重新做一次自适应,
    [self sizeToFit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
