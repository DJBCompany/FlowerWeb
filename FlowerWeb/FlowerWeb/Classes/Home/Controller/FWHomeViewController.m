//
//  FWHomeViewController.m
//  FlowerWeb
//
//  Created by DH on 16/3/26.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "FWHomeViewController.h"
#import <YYLabel.h>

@interface FWHomeViewController()

@property (nonatomic, weak) UIView *navView;

@end



@implementation FWHomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self setNav];
}


- (void)setNav
{
    // 252 102 33
    self.navigationController.navigationBar.barTintColor = DHRGB(252, 102, 33);
    UIView *navView = [[UIView alloc] init];
    
    navView.width = ScreenWidth;
    navView.height = 44;
    self.navView = navView;
    
//    titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = navView;
    
    YYLabel *label = [YYLabel new];
    
    label.text = @"HUA";
    label.frame = CGRectMake(0, 0, 200, self.navView.height);
    [self.navView addSubview:label];
    
    // 1.创建一个属性文本
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:@"HUA"];
    
}

@end
