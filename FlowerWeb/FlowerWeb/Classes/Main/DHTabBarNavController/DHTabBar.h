//
//  DHTabBar.h
//  lotteryticket
//
//  Created by DH on 16/1/5.
//  Copyright © 2016年 DH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHTabBar;
@protocol DHTabBarDelegate <NSObject>


@optional
- (void)tabBar:(DHTabBar *)tabBar tabBarBtnDidSelectedWithCurrentIndex:(NSInteger)index;



@end

@interface DHTabBar : UIView


@property (nonatomic, weak) id<DHTabBarDelegate> delegate;

- (void)addTabBarBtnWithItem:(UITabBarItem *)item;

@property (nonatomic, copy) void(^btnClickBlock)(DHTabBar *tabBar, NSInteger index);

@end
