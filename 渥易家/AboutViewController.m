//
//  AboutViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "AboutViewController.h"
#import "SetTableViewCell.h"
@interface AboutViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *titleArr;
}
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *hideLabel;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *hide1Label;
@end

@implementation AboutViewController

- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于平台";
    self.view.backgroundColor = getColor(@"1a1a1a");
    
    titleArr = @[@"给我们评分",@"官方微信",@"常见问题"];
    
    self.imgView = [[UIImageView alloc]init];
    [self.view addSubview:self.imgView];
    self.imgView.frame = CGRectMake(SCREENWIGTH/2 - 75, 50, 150, 150);
    self.imgView.image = [UIImage imageNamed:@"logo"];
    self.imgView.layer.masksToBounds = YES;
    self.imgView.layer.cornerRadius = 30;
    
    self.hideLabel = [[UILabel alloc]init];
    [self.view addSubview:self.hideLabel];
    self.hideLabel.frame = CGRectMake(0, 220, SCREENWIGTH, 45);
    self.hideLabel.numberOfLines = 2;
    self.hideLabel.textAlignment = NSTextAlignmentCenter;
    self.hideLabel.textColor = getColor(@"7fa91e");
    self.hideLabel.text = @"渥易家\n1.10";
    self.hideLabel.font = DEF_FontSize_16;
    
    [self setTableView];
    
    self.hide1Label = [[UILabel alloc]init];
    [self.view addSubview:self.hide1Label];
    self.hide1Label.frame = CGRectMake(0, SCREENHEIGHT - 144, SCREENWIGTH, 45);
    self.hide1Label.numberOfLines = 2;
    self.hide1Label.textAlignment = NSTextAlignmentCenter;
    self.hide1Label.textColor = getColor(@"3c3c3c");
    self.hide1Label.text = @"渥易家 版权所有\nCopy Right 2011-2015 Easy Home All Right Reserved";
    self.hide1Label.font = DEF_FontSize_12;
}

-(void)setTableView{
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = getColor(@"1a1a1a");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.frame = CGRectMake(0, 280, SCREENWIGTH, SCREENHEIGHT-400);
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SetTableViewCell *cell = [SetTableViewCell cellForTableView:tableView];
    cell.model = titleArr[indexPath.row];
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
