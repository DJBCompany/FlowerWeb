//
//  DHTabBarController.m
//  lotteryticket
//
//  Created by DH on 16/1/5.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "DHTabBarController.h"
#import "DHTabBar.h"
#import "DHNavigationController.h"

#import "FWHomeViewController.h"
#import "DHFindViewController.h"
#import "DHBuyCarViewController.h"
#import "DHMineViewController.h"
#import "DHFlowerShowViewController.h"

@interface DHTabBarController()<DHTabBarDelegate>

@property (nonatomic, weak) DHTabBar *customTabBar;


@end

@implementation DHTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            // 移除系统自动生成的按钮,否则盖在上面自己添加的就不能点击了
            [child removeFromSuperview];
        }
    
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化自定义的tabBar
    [self setupCustomTabBar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewController];

}

/**
 *   初始化所有的子控制器
 */
- (void)setupAllChildViewController
{
    
    [self setupChildViewControllerWithClass:[FWHomeViewController class] andNomalImageName:@"ico_nav_homepage" andNaVTitle:@"首页"];
    [self setupChildViewControllerWithClass:[FWHomeViewController class] andNomalImageName:@"ico_nav_category" andNaVTitle:@"分类"];
    [self setupChildViewControllerWithClass:[FWHomeViewController class] andNomalImageName:@"ico_nav_myflower" andNaVTitle:@"花现"];
    [self setupChildViewControllerWithClass:[FWHomeViewController class] andNomalImageName:@"ico_nav_shoppingcart" andNaVTitle:@"购物车"];
    [self setupChildViewControllerWithClass:[FWHomeViewController class] andNomalImageName:@"ico_nav_more" andNaVTitle:@"更多"];
    
}



- (void)setupChildViewControllerWithClass:(Class)ChildClass andNomalImageName:(NSString *)nomalImageName andNaVTitle:(NSString *)NavTitle
{
    
    UIViewController *childVC = [[ChildClass alloc] init];
    
    // 包装一个导航控制器
    DHNavigationController *navC = [[DHNavigationController alloc] initWithRootViewController:childVC];
    // 设置子自控制器的item
    childVC.tabBarItem.image = [UIImage imageNamed:nomalImageName];
    
    NSString *selectedImageName = [NSString stringWithFormat:@"%@_active", nomalImageName];
    
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    childVC.navigationItem.title = NavTitle;
    // 添加子控制器
    [self addChildViewController:navC];
    // 添加按钮
    [self.customTabBar addTabBarBtnWithItem:childVC.tabBarItem];

}

- (void)setupCustomTabBar
{
    DHTabBar *customTabBar = [[DHTabBar alloc] init];
    customTabBar.backgroundColor = DHRGB(245, 155, 181);
    
    // 设置尺寸
    customTabBar.frame = self.tabBar.bounds;
    
    // 添加到系统的tabBar上
    [self.tabBar addSubview:customTabBar];
    
    // 赋值给成员变量
    self.customTabBar = customTabBar;
    
    // 下面的
    __unsafe_unretained DHTabBarController *mySelf = self;
    // 给block赋值
    customTabBar.btnClickBlock = ^(DHTabBar *customTabBar, NSInteger index){
        mySelf.selectedIndex = index;
    };

}

@end
