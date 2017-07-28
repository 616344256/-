//
//  ClassifyViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "ClassifyViewController.h"
#import "ClassifyCollectionViewCell.h"
@interface ClassifyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIImageView *hideImgView;
@end

@implementation ClassifyViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleStr;
    self.view.backgroundColor = getColor(@"1a1a1a");
    [self setCollectionView];
    
    self.hideImgView = [[UIImageView alloc]init];
    [self.view addSubview:self.hideImgView];
    self.hideImgView.frame = CGRectMake(SCREENWIGTH/2 - 15, SCREENHEIGHT - 90, 30, 15);
    self.hideImgView.image = [UIImage imageNamed:@"xia"];
}

-(void)setCollectionView{
    
    UICollectionViewFlowLayout *flowLayout1 =
    [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.itemSize = CGSizeMake((SCREENWIGTH - 2) / 2 ,
                                      (SCREENWIGTH - 2) / 2);
    flowLayout1.minimumInteritemSpacing = 0.0f;
    flowLayout1.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    
    self.collectionView = [[UICollectionView alloc]
                               initWithFrame:CGRectMake(0, 0, SCREENWIGTH,SCREENHEIGHT - 100)
                               collectionViewLayout:flowLayout1];
    self.collectionView.backgroundColor = getColor(@"1a1a1a");
    
    //隐藏滚动条
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

//推荐数量
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  
    return 6;
}

//品牌商品数据
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

        NSString *identifier=[NSString stringWithFormat:@"classity%ld",(long)indexPath.row];
        [self.collectionView registerClass:[ClassifyCollectionViewCell class] forCellWithReuseIdentifier:identifier];
        
        ClassifyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: identifier forIndexPath:indexPath];
        cell.model = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        return cell;
}


#pragma mark - UICollectionViewDelegate

//推荐详情
- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
