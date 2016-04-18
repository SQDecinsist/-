//
//  UIImage+Image.m
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageWithRenderImageName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
