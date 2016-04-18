//
//  SQRowItem.h
//  彩票
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 SQ. All rights reserved.
//




#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    kSQRowAccessoryTypeArrow,
    kSQRowAccessoryTypeSwitch,
} SQRowAccessoryType;


@interface SQRowItem : NSObject

/** 每行的图片*/
//@property (strong, nonatomic) UIImageView *imageV;
@property (strong, nonatomic) UIImage *image;

/** 每行的文字*/
@property (copy, nonatomic) NSString *title;

/** 每行的细节文本*/
@property (copy, nonatomic) NSString *detailText;

///** accessory*/
//@property (assign, nonatomic) SQRowAccessoryType rowAccessoryType;

///** 设置要跳转的控制器的名称*/
//@property (assign, nonatomic) Class desClass;
//
///** 要执行的某段代码*/
//@property (copy, nonatomic)  void(^operationTask)();

+ (instancetype)rowItemWithImage:(UIImage *)image title:(NSString *)title;
@end
