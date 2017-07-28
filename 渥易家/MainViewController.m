//
//  MainViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/26.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "MainViewController.h"
#import <SDCycleScrollView.h>
#import "LMJDropdownMenu.h"
#import "PeopleCollectionViewCell.h"
#import "DoorCollectionViewCell.h"
#import "LeftTableViewCell.h"
#import "RightTableViewCell.h"
#import "MyViewController.h"
@interface MainViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate,leftCellDelegate,LMJDropdownMenuDelegate>{

    NSArray *imgArr;
}
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UITableView *leftTableView;
@property(nonatomic,strong)UITableView *rightTableView;
@property(nonatomic,strong)UICollectionView *peopleCollectionView;
@property(nonatomic,strong)UICollectionView *doorCollectionView;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIButton *myBtn;
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    imgArr = @[@"美食",@"药店",@"医院",@"便利店",@"滴滴出行",@"咖啡厅",@"车票"];
    [self AFNetWorking];
    [self setScrollView];
    [self setTableView];
    [self setCollectionView];
    [self setUI];
}

-(void)AFNetWorking{

    
    AFHTTPSessionManager *manager0 = [AFHTTPSessionManager manager];
    
    manager0.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager0.requestSerializer=[AFHTTPRequestSerializer serializer];
    [manager0 GET:[NSString stringWithFormat:@"http://suoadmin.slkfz.cn/api/api/my_community?token=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"User_token"]] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"http://suoadmin.slkfz.cn/api/api/lock_list?token=%@&plot_id=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"User_token"],@""] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)setUI{
    
    LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
    [dropdownMenu setFrame:CGRectMake(SCREENWIGTH, 10, 110, 40)];
    [dropdownMenu setMenuTitles:@[@"香榭丽媛",@"月星国际城",@"选项三",@"选项四"] rowHeight:30];
    dropdownMenu.delegate = self;
    [self.scrollView addSubview:dropdownMenu];
    
    self.myBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.scrollView addSubview:self.myBtn];
    self.myBtn.frame = CGRectMake(SCREENWIGTH*2 - 50, 10, 40, 40);

    [self.myBtn setImage:[UIImage imageNamed:@"我的"] forState:UIControlStateNormal];
    [self.myBtn addTarget:self action:@selector(myBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    NSArray *imageNames = @[@"banner",
                            @"banner.jpg",
                            @"banner.jpg",
                            @"banner.jpg",
                            @"banner" // 本地图片请填写全名
                            ];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(SCREENWIGTH, 64, SCREENWIGTH, SCREENWIGTH *335/750.0) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [self.scrollView addSubview:cycleScrollView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [self.scrollView addSubview:titleLabel];
    titleLabel.frame = CGRectMake(SCREENWIGTH * 2, 20, SCREENWIGTH, 40);
    titleLabel.text = @"邻聚";
    titleLabel.textColor = getColor(@"7fa91e");
    titleLabel.font = [UIFont systemFontOfSize:28];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.leftBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:self.leftBtn];
    self.leftBtn.frame = CGRectMake(20, SCREENHEIGHT - 60, 80, 40);
    [self.leftBtn setTitle:@"猫眼" forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:getColor(@"7fa91e") forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"左滑"] forState:UIControlStateNormal];
    self.leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [self.leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,self.leftBtn.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [self.leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, self.leftBtn.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
    [self.leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.view addSubview:self.rightBtn];
    self.rightBtn.frame = CGRectMake(SCREENWIGTH - 100, SCREENHEIGHT - 60, 100, 40);
    [self.rightBtn setTitle:@"邻聚" forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:getColor(@"7fa91e") forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"右滑"] forState:UIControlStateNormal];
    self.rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [self.rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,0, 0.0,self.rightBtn.imageView.frame.size.width + 20)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [self.rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0.0, self.rightBtn.titleLabel.bounds.size.width+30,0.0, 0)];//图片距离右边框距离减少图片的宽度，其它不边
    [self.rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *midImgView = [[UIImageView alloc]init];
    [self.view addSubview:midImgView];
    midImgView.frame = CGRectMake(SCREENWIGTH/2 - 30, SCREENHEIGHT - 70, 60, 60);
    midImgView.image = [UIImage imageNamed:@"中间按钮"];
    
    
}

-(void)setScrollView{

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIGTH, SCREENHEIGHT)];
    self.scrollView.backgroundColor = getColor(@"1a1a1a");
    // 是否支持滑动最顶端
//    self.scrollView.scrollsToTop = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    // 是否反弹
    self.scrollView.bounces = YES;
  
    // 是否分页
    self.scrollView.pagingEnabled = YES;
    // 是否滚动
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // 设置indicator风格
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    // 设置内容的边缘和Indicators边缘
//    self.scrollView.contentInset = UIEdgeInsetsMake(0, 50, 50, 0);
//    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    // 设置内容大小
    self.scrollView.contentSize = CGSizeMake(SCREENWIGTH * 3, 0);
    self.scrollView.directionalLockEnabled = YES;

    [self.scrollView setContentOffset:CGPointMake(SCREENWIGTH * 1.0, 0) animated:NO];
}

-(void)setTableView{
    
    self.leftTableView = [[UITableView alloc]init];
    [self.scrollView addSubview:self.leftTableView];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.leftTableView.tableFooterView = [UIView new];
    self.leftTableView.frame = CGRectMake(0, 0, SCREENWIGTH, SCREENHEIGHT-100);
    self.leftTableView.backgroundColor = getColor(@"1a1a1a");
    
    self.rightTableView = [[UITableView alloc]init];
    [self.scrollView addSubview:self.rightTableView];
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    self.rightTableView.tableFooterView = [UIView new];
    self.rightTableView.frame = CGRectMake(SCREENWIGTH*2, 64, SCREENWIGTH, SCREENHEIGHT-64);
    self.rightTableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    self.rightTableView.backgroundColor = getColor(@"1a1a1a");
}

-(void)setCollectionView{
    UICollectionViewFlowLayout *flowLayout =
    [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((SCREENWIGTH - 4) / 4 ,
                                     SCREENWIGTH*240/750.0);
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    self.peopleCollectionView = [[UICollectionView alloc]
                               initWithFrame:CGRectMake(SCREENWIGTH, SCREENWIGTH *335/750.0 + 64, SCREENWIGTH,SCREENWIGTH*240/750.0)
                               collectionViewLayout:flowLayout];
    self.peopleCollectionView.backgroundColor = getColor(@"262626");
    
    //隐藏滚动条
    self.peopleCollectionView.showsVerticalScrollIndicator = NO;
    self.peopleCollectionView.delegate = self;
    self.peopleCollectionView.dataSource = self;
    self.peopleCollectionView.scrollEnabled = YES;
    
    [self.scrollView addSubview:self.peopleCollectionView];
    
    
    
    UICollectionViewFlowLayout *flowLayout1 =
    [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake((SCREENWIGTH - 3) / 3 ,
                                     (SCREENHEIGHT -SCREENWIGTH *575/750.0 - 164)/2);
    flowLayout1.minimumInteritemSpacing = 0.0f;
    flowLayout1.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    
    self.doorCollectionView = [[UICollectionView alloc]
                                initWithFrame:CGRectMake(SCREENWIGTH, SCREENWIGTH *575/750.0 + 64, SCREENWIGTH,SCREENHEIGHT -SCREENWIGTH *575/750.0 - 164 )
                                collectionViewLayout:flowLayout1];
    self.doorCollectionView.backgroundColor = getColor(@"1a1a1a");
    
    //隐藏滚动条
    self.doorCollectionView.showsVerticalScrollIndicator = NO;
    self.doorCollectionView.delegate = self;
    self.doorCollectionView.dataSource = self;
    self.doorCollectionView.scrollEnabled = YES;
    
    [self.scrollView addSubview:self.doorCollectionView];
}

#pragma  mark - click

-(void)myBtnClick:(id)send{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MyViewController *VC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MyViewController class])];
    [self.navigationController pushViewController:VC animated:YES];
}

-(void)leftBtnClick:(id)send{
    
    CGFloat coefficient = _scrollView.contentOffset.x / SCREENWIGTH;
    if (coefficient < 1) {
        [self.scrollView setContentOffset:CGPointMake(SCREENWIGTH * 2.0, 0) animated:NO];
    }else if (coefficient < 2){
        [self.scrollView setContentOffset:CGPointMake(SCREENWIGTH * 0.0, 0) animated:NO];
    }else if (coefficient < 3){
        [self.scrollView setContentOffset:CGPointMake(SCREENWIGTH * 1.0, 0) animated:NO];
    }
}

-(void)rightBtnClick:(id)send{
    
    CGFloat coefficient = _scrollView.contentOffset.x / SCREENWIGTH;
    if (coefficient < 1) {
        [self.scrollView setContentOffset:CGPointMake(SCREENWIGTH * 1.0, 0) animated:NO];
    }else if (coefficient < 2){
        [self.scrollView setContentOffset:CGPointMake(SCREENWIGTH * 2.0, 0) animated:NO];
    }else if (coefficient < 3){
        [self.scrollView setContentOffset:CGPointMake(SCREENWIGTH * 0.0, 0) animated:NO];
    }
    
}

#pragma mark - UICollectionViewDataSource

//推荐数量
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    if (self.peopleCollectionView == collectionView) {
        
        return 5;
    }else if (self.doorCollectionView == collectionView){
        return 8;
    }
    return 0;
}

//品牌商品数据
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.peopleCollectionView == collectionView) {
        NSString *identifier=[NSString stringWithFormat:@"people%ld",(long)indexPath.row];
        [self.peopleCollectionView registerClass:[PeopleCollectionViewCell class] forCellWithReuseIdentifier:identifier];
        
        PeopleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
        
        return cell;
    }else if (self.doorCollectionView == collectionView){
        
        NSString *identifier=[NSString stringWithFormat:@"door%ld",(long)indexPath.row];
        [self.doorCollectionView registerClass:[DoorCollectionViewCell class] forCellWithReuseIdentifier:identifier];
        
        DoorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
        
        return cell;
    }
    return nil;
    
}


#pragma mark - UICollectionViewDelegate

//推荐详情
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITableViewDelegate


-(void)likeBtnwithIndex:(NSIndexPath *)index{

    
}

-(void)zanBtnwithIndex:(NSIndexPath *)index{

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.leftTableView) {
        return 240;
    }else if (tableView == self.rightTableView){
        
        return 70;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.leftTableView) {
        return 6;
    }else if (tableView == self.rightTableView){
        
        return imgArr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
        LeftTableViewCell *cell = [LeftTableViewCell cellForTableView:tableView];
        cell.delegate = self;
        //    cell.model = self.dataArr[indexPath.row];
        return cell;
    }else if (tableView == self.rightTableView){
    
        RightTableViewCell *cell = [RightTableViewCell cellForTableView:tableView];
        cell.model = imgArr[indexPath.row];
        return cell;
    }
    return nil;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat coefficient = _scrollView.contentOffset.x / SCREENWIGTH;
    if (coefficient < 1) {
       [self.leftBtn setTitle:@"邻聚" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"开锁" forState:UIControlStateNormal];
    }else if (coefficient < 2){
       [self.leftBtn setTitle:@"猫眼" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"邻聚" forState:UIControlStateNormal];
    }else if (coefficient < 3){
       [self.leftBtn setTitle:@"开锁" forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"猫眼" forState:UIControlStateNormal];
    }
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
