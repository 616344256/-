//
//  LoginViewController.m
//  渥易家
//
//  Created by 姜祺 on 17/7/26.
//  Copyright © 2017年 chengwo. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "RegistViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
@property (strong, nonatomic) IBOutlet UIButton *forgetBtn;
@property (strong, nonatomic) IBOutlet UIButton *rigstBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setPhoneTextField:(UITextField *)phoneTextField{
    
    _phoneTextField = phoneTextField;
    _phoneTextField.delegate = self;

    _phoneTextField.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.14];
    _phoneTextField.layer.masksToBounds = YES;
    _phoneTextField.layer.cornerRadius = 10;
    
    UIImageView *imageViewPwd=[[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 25, 15)];
    imageViewPwd.image=[UIImage imageNamed:@"电话"];
    _phoneTextField.leftView=imageViewPwd;
    _phoneTextField.leftViewMode=UITextFieldViewModeAlways; //此处用来设置leftview现实时机
    _phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_phoneTextField setValue:getColor(@"9a9a9a") forKeyPath:@"_placeholderLabel.textColor"];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"User_phone"]) {
        _phoneTextField.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"User_phone"];
    }
}

-(void)setPasswordTextField:(UITextField *)passwordTextField{
    
    _passwordTextField = passwordTextField;
    _passwordTextField.delegate = self;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.tintColor = [UIColor whiteColor];
    _passwordTextField.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.14];
    UIImageView *imageViewPwd=[[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 25, 15)];
    imageViewPwd.image=[UIImage imageNamed:@"填写"];
    _passwordTextField.leftView=imageViewPwd;
    _passwordTextField.leftViewMode=UITextFieldViewModeAlways; //此处用来设置leftview现实时机
    _passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passwordTextField.layer.masksToBounds = YES;
    _passwordTextField.layer.cornerRadius = 10;
    [_passwordTextField setValue:getColor(@"9a9a9a") forKeyPath:@"_placeholderLabel.textColor"];
//    _userNmaeTextField.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"User_passWord"];
}

-(void)setSendBtn:(UIButton *)sendBtn{
    
    _sendBtn = sendBtn;
    self.sendBtn.titleLabel.font = DEF_FontSize_14;
    self.sendBtn.layer.borderWidth = 1;
    self.sendBtn.layer.borderColor = getColor(@"80aa1f").CGColor;
    self.sendBtn.layer.masksToBounds = YES;
    self.sendBtn.layer.cornerRadius = 5;
    [self.sendBtn addTarget:self action:@selector(sendBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setRigstBtn:(UIButton *)rigstBtn{
    _rigstBtn = rigstBtn;
    [_rigstBtn addTarget:self action:@selector(rigstBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)rigstBtnClick:(id)send{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegistViewController *VC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([RegistViewController class])];

    [self presentViewController:VC animated:YES completion:^{
    }];
    
//    [self.navigationController pushViewController:VC animated:YES];
}

-(void)sendBtnClick:(id)send{
    
    if (![_phoneTextField.text isEqualToString:@""]&&![_passwordTextField.text isEqualToString:@""]) {
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        manager.requestSerializer=[AFHTTPRequestSerializer serializer];
        // 拼接请求参数
        NSDictionary *params = @{@"mobilephone":_phoneTextField.text,@"password":_passwordTextField.text};
        
        [manager POST:[NSString stringWithFormat:@"http://suoadmin.slkfz.cn/api/api/login"] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"请求成功:%@", responseObject);
            if ([[responseObject objectForKey:@"msg"] isEqualToString:@"成功"]) {
                [[NSUserDefaults standardUserDefaults] setObject:[responseObject objectForKey:@"mobilephone"] forKey:@"User_phone"];
                [[NSUserDefaults standardUserDefaults] setObject:[responseObject objectForKey:@"token"] forKey:@"User_token"];
                MainViewController *vc = [[MainViewController alloc]init];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
                [self presentViewController:nav animated:YES completion:^{
                }];
                
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"请求失败:%@", error.description);
            
        }];
        
    }else{
        
        [self showMessage:@"请输入正确的账号密码"];
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
