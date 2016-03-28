//
//  DHFindViewController.m
//  FlowerWeb
//
//  Created by DH on 16/3/27.
//  Copyright © 2016年 DH. All rights reserved.
//

#import "DHFindViewController.h"
#import "UIView+DHAdd.h"

@interface DHFindViewController ()<UITableViewDataSource>
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
    self.view.backgroundColor = [UIColor greenColor];
    [self creatLeftTableView];
    //关闭毛玻璃效果
    self.navigationController.navigationBar.translucent = NO;
    
    
}


#pragma mark --创建左侧的tableView
-(void)creatLeftTableView{
    UITableView *talbeView = [[UITableView alloc]init];
    talbeView.frame = CGRectMake(0, 0, 100, ScreenHeight-self.tabBarController.tabBar.height);
    [self.view addSubview:talbeView];
    talbeView.dataSource = self;
    ///设置行高
    talbeView.rowHeight = (ScreenHeight - 64 -44) / self.leftDataArr.count;
}

#pragma mark --tableView的数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%zd",self.leftDataArr.count);
    return self.leftDataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseId = @"tableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.textLabel.text = self.leftDataArr[indexPath.row];
    return cell;
    
}


@end
