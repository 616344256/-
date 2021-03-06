//
//  PersonViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonTableViewCell.h"
@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *titleArr;
}
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation PersonViewController

- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = getColor(@"1a1a1a");
    titleArr = @[@[@"头像",@"昵称"],@[@"性别",@"地区",@"常用住址"]];
    [self setTableView];
}

-(void)setTableView{
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = getColor(@"1a1a1a");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.frame = CGRectMake(0, 0, SCREENWIGTH, SCREENHEIGHT-164);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *lineView = [[UIView alloc]init];
    lineView.frame = CGRectMake(0, 0, SCREENWIGTH, 20);
    lineView.backgroundColor = getColor(@"1a1a1a");
    
    UIView *whiteView = [[UIView alloc]init];
    whiteView.frame = CGRectMake(0, 10, SCREENWIGTH, 1);
    whiteView.backgroundColor = getColor(@"3c3c3c");
    [lineView addSubview:whiteView];
    return lineView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return [titleArr[section] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonTableViewCell *cell = [PersonTableViewCell cellForTableView:tableView];
    cell.model = titleArr[indexPath.section][indexPath.row];
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
