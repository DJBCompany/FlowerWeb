//
//  DHTabBar.m
//  lotteryticket
//
//  Created by DH on 16/1/5.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "DHTabBar.h"
#import "DHTabBarButton.h"

@interface DHTabBar()

/**
 *  这个按钮的作用是来记录上个按钮的状态
 */
@property (nonatomic, weak) DHTabBarButton *tempTabBarBtn;
/**
 *  存放添加的按钮
 */
@property (nonatomic, strong) NSMutableArray *tabBarBtnArray;

@end

@implementation DHTabBar


- (NSMutableArray *)tabBarBtnArray
{
    if (_tabBarBtnArray == nil) {
        _tabBarBtnArray = [NSMutableArray array];
    }
    return _tabBarBtnArray;
}

- (instancetype)init
{
    if (self = [super init]) {
//        self.backgroundColor = [UIColor redColor];
    
        }
    
    return self;
}


/**
 *   布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 遍历子控件
    for (int i = 0; i < self.tabBarBtnArray.count; i ++) {
        // 计算尺寸
        CGFloat tabBarBtnW = self.bounds.size.width / self.tabBarBtnArray.count;
        CGFloat tabBarBtnH = self.bounds.size.height;
        CGFloat tabBarBtnY = 0;
        CGFloat tabBarBtnX = tabBarBtnW * i;
        
        // 取出每个子控件
        DHTabBarButton *tabBarBtn = self.tabBarBtnArray[i];
        tabBarBtn.frame = CGRectMake(tabBarBtnX, tabBarBtnY, tabBarBtnW, tabBarBtnH);
        
    }
    
}

- (void)addTabBarBtnWithItem:(UITabBarItem *)item
{
    
    // 创建按钮
    DHTabBarButton *tabBarBtn = [[DHTabBarButton alloc] init];
    // 绑定tag
    tabBarBtn.tag = self.tabBarBtnArray.count;
    // 监听按钮的点击
    [tabBarBtn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    // 添加按钮
    [self addSubview:tabBarBtn];
    
    // 添加按钮到数组
    [self.tabBarBtnArray addObject:tabBarBtn];
    // 设置子控件的图片
    [tabBarBtn setImage:item.image forState:UIControlStateNormal];

    
    if (item.selectedImage) {
        // 设置选中的图片
        [tabBarBtn setImage:item.selectedImage forState:UIControlStateSelected];

    }
    // 设置按钮的文字
    [tabBarBtn setTitle:item.title forState:UIControlStateNormal];
    
    // 默认选择第一个btn
    if (self.tabBarBtnArray.count == 1)
    {
        [self tabBarButtonClick:tabBarBtn];
    }

}

- (void)tabBarButtonClick:(DHTabBarButton *)tabBarButton
{
    // 这个时候告诉代理，老子点的是第几个按钮
    if ([self.delegate respondsToSelector:@selector(tabBar:tabBarBtnDidSelectedWithCurrentIndex:)]) {
        
        [self.delegate tabBar:self tabBarBtnDidSelectedWithCurrentIndex:tabBarButton.tag];
    }
    if (self.btnClickBlock) { // 如果block有值
        
        self.btnClickBlock(self, tabBarButton.tag);
    }
    
    // 三部曲
    self.tempTabBarBtn.selected = NO;
        //NSLog(@"----");
    tabBarButton.selected = YES;
    
    self.tempTabBarBtn = tabBarButton;
    
    
}

@end
