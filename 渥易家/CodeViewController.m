//
//  CodeViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/28.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "CodeViewController.h"

@interface CodeViewController ()
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *hideLabel;
@end

@implementation CodeViewController

- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二维码";
    self.view.backgroundColor = getColor(@"1a1a1a");
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, 0, 20, 20);
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shareBtn];
    [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.imgView = [[UIImageView alloc]init];
    [self.view addSubview:self.imgView];
    self.imgView.frame = CGRectMake(40, 100, SCREENWIGTH - 80, SCREENWIGTH - 80);
    self.imgView.image = [UIImage imageNamed:@"code"];
    
    self.hideLabel = [[UILabel alloc]init];
    [self.view addSubview:self.hideLabel];
    self.hideLabel.frame = CGRectMake(0, SCREENWIGTH + 40, SCREENWIGTH, 20);
    self.hideLabel.textAlignment = NSTextAlignmentCenter;
    self.hideLabel.textColor = getColor(@"c3c3c3");
    self.hideLabel.text = @"推荐二维码，让更多人关注我";
    self.hideLabel.font = DEF_FontSize_16;
}

-(void)shareBtnClick:(id)send{

    
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
