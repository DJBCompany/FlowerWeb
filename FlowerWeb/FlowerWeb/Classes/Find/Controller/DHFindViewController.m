//
//  DHFindViewController.m
//  FlowerWeb
//
//  Created by DH on 16/3/27.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "DHFindViewController.h"

@interface DHFindViewController ()
///左侧tableView数据
@property(nonatomic,strong)NSArray *leftDataArr ;

@end

@implementation DHFindViewController

///懒加载数据
-(NSArray *)leftDataArr{
    if (_leftDataArr == nil) {
        _leftDataArr = @[@"常用分类",@"鲜花",@"蛋糕",@"永生花",@"礼篮",@"商务鲜花",@"绿植花卉",@"品牌公仔",@"特色产品"];
    }
    return _leftDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


#pragma mark --创建左侧的tableView
-(void)creatLeftTableView{
    UITableView *talbeView = [[UITableView alloc]init];
//    talbeView.frame = CGRectMake(0, 0, 80, <#CGFloat height#>)
    
    
    
    
}


@end
