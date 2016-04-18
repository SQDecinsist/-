//
//  SQTabBarView.h
//  彩票
//
//  Created by Mac on 16/3/26.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^myBlock)(NSInteger);
@class SQTabBarView;
@protocol SQTabBarViewDelegate <NSObject>

- (void)tabBarViewClickTabBar:(SQTabBarView *)tabBarView selectedIndex:(NSInteger)index;

@end
@interface SQTabBarView : UIView
/** <#说明#>*/
@property (strong, nonatomic) NSMutableArray *itemArrM;
/** delegate*/
@property (weak, nonatomic) id<SQTabBarViewDelegate> delegate;
/** 代码块*/
@property (copy, nonatomic) myBlock myBlock;
@end
