//
//  MyViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/27.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "MyViewController.h"
#import "SetViewController.h"
#import "AboutViewController.h"
#import "CodeViewController.h"
#import "MyLikeViewController.h"
#import "SafeViewController.h"
#import "PersonViewController.h"
@interface MyViewController ()
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UIButton *setBtn;
@property (strong, nonatomic) IBOutlet UIImageView *headImaView;
@property (strong, nonatomic) IBOutlet UIImageView *isNamedImgView;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UIButton *myBtn;
@property (strong, nonatomic) IBOutlet UIButton *myLikeBtn;
@property (strong, nonatomic) IBOutlet UIButton *safeBtn;
@property (strong, nonatomic) IBOutlet UIButton *aboutBtn;
@property (strong, nonatomic) IBOutlet UIButton *codeBtn;

@end

@implementation MyViewController

- (void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBtn:self.myBtn];
    [self initBtn:self.myLikeBtn];
    [self initBtn:self.safeBtn];
    [self initBtn:self.aboutBtn];
    [self initBtn:self.codeBtn];
    self.myLikeBtn.backgroundColor = [UIColor colorWithRed:128/255.0 green:170/255.0 blue:31/255.0 alpha:1];
}

-(void)initBtn:(UIButton *)btn{
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 20;
    btn.backgroundColor = [UIColor colorWithRed:154/255.0 green:154/255.0 blue:154/255.0 alpha:0.2];
    
}

- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)setBtnClick:(id)sender {
    
    SetViewController *VC = [[SetViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
    
}
- (IBAction)myBtnClick:(id)sender {
    PersonViewController *VC = [[PersonViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)myLikeBtnClick:(id)sender {
    MyLikeViewController  *vc = [[MyLikeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)safeBtnClick:(id)sender {
    SafeViewController *VC = [[SafeViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)aboutBtnClick:(id)sender {
    
    AboutViewController  *vc = [[AboutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)codeBtnClick:(id)sender {
    CodeViewController  *vc = [[CodeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
