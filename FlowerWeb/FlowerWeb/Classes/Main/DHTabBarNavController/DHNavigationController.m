//
//  DHNavigationController.m
//  lotteryticket
//
//  Created by DH on 16/1/5.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "DHNavigationController.h"

@implementation DHNavigationController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@---",NSStringFromCGRect(self.view.frame));
}

// 系统在第一次使用时这个类时会调用这个方法
+ (void)initialize
{
    
    // 获取导航条
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.translucent = YES;
//    navBar.alpha = 0.3;
    // 设置导航条的背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *titleAttrs = [NSMutableDictionary dictionary];
    titleAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];

    
    // 设置标题的文字颜色
    navBar.titleTextAttributes = titleAttrs;
    
    // 获取按钮
    UIBarButtonItem *navItem = [UIBarButtonItem appearance];
    
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    
    // 设置文字的颜色
    [navItem setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
}

- (void)showViewController:(UIViewController *)vc sender:(id)sender
{
    // 隐藏状态栏
    vc.hidesBottomBarWhenPushed = YES;
    [super showViewController:vc sender:sender];
}

@end
