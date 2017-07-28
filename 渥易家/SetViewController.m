//
//  SetViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/27.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "SetViewController.h"
#import "SetTableViewCell.h"
#import "LoginViewController.h"
@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>{

    NSArray *titleArr;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *outBtn;
@end

@implementation SetViewController

- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.view.backgroundColor = getColor(@"1a1a1a");
    titleArr = @[@[@"新消息通知",@"隐私",@"一般"],@[@"意见反馈"]];
    [self setTableView];
    [self setOutBtn];
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

-(void)setOutBtn{

    self.outBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.outBtn];
    self.outBtn.frame = CGRectMake(30 ,SCREENHEIGHT-144, SCREENWIGTH - 60, 45);
    [self.outBtn setTitle:@"退出" forState:UIControlStateNormal];
    [self.outBtn setTitleColor:getColor(@"1a1a1a") forState:UIControlStateNormal];
    [self.outBtn setBackgroundColor:getColor(@"7fa91e")];
    self.outBtn.layer.masksToBounds = YES;
    self.outBtn.layer.cornerRadius = 5;
    [self.outBtn addTarget:self action:@selector(outBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)outBtnClick:(id)send{

    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"User_token"];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([LoginViewController class])];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
    nav.navigationBar.translucent = YES;
    [self showMessage:@"退出成功"];
    [self presentViewController:nav animated:YES completion:nil];
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
    SetTableViewCell *cell = [SetTableViewCell cellForTableView:tableView];
    cell.model = titleArr[indexPath.section][indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
