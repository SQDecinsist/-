//
//  SQNewFeatureCollectionViewCell.m
//  彩票
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQNewFeatureCollectionViewCell.h"


@interface SQNewFeatureCollectionViewCell ()
@property (nonatomic ,weak)UIImageView *imageV;
@end

@implementation SQNewFeatureCollectionViewCell
//我的代码
//- (void)setImage:(UIImage *)image{
//    _image = image;
//    
//    UIImageView *imageV =[[UIImageView alloc] initWithImage:image];
//    imageV.frame = self.bounds;
//    [self.contentView addSubview:imageV];
//    
//}

//老师代码
//为什么还要搞个懒加载
- (UIImageView *)imageV {
    
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = self.bounds;
        [self.contentView addSubview:imageV];
        _imageV = imageV;
    }
    return _imageV;
}



- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageV.image = image;
}
@end
