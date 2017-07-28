//
//  MyLikeViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "MyLikeViewController.h"
#import "LeftTableViewCell.h"
@interface MyLikeViewController ()<UITableViewDelegate,UITableViewDataSource,leftCellDelegate>
@property(nonatomic,strong)UITableView *leftTableView;
@end

@implementation MyLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    [self setTableView];
}

-(void)setTableView{
    
    self.leftTableView = [[UITableView alloc]init];
    [self.view addSubview:self.leftTableView];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.leftTableView.tableFooterView = [UIView new];
    self.leftTableView.frame = CGRectMake(0, 0, SCREENWIGTH, SCREENHEIGHT-64);
    self.leftTableView.backgroundColor = getColor(@"1a1a1a");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate


-(void)likeBtnwithIndex:(NSIndexPath *)index{
    
    
}

-(void)zanBtnwithIndex:(NSIndexPath *)index{
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 240;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    LeftTableViewCell *cell = [LeftTableViewCell cellForTableView:tableView];
    cell.delegate = self;
        //    cell.model = self.dataArr[indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
