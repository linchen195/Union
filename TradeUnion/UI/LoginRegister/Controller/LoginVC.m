//
//  LoginVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/20.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "LoginVC.h"
#import "RegisterVC.h"
#import "ForgetVC.h"
#import "CodeLoginVC.h"

@interface LoginVC ()<UITextFieldDelegate>

@property (nonatomic,strong) LoginTextField *phoneTf;
@property (nonatomic,strong) LoginTextField *passwordTf;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *forgetPassBtn;
@property (nonatomic,strong) UIButton *codeLoginBtn;
@property (nonatomic,strong) UIButton *registerBtn;

@end

@implementation LoginVC

#pragma mark 状态栏颜色
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNavigation];
    
    [self createTextField];
    
    [self createButton];
}

#pragma mark 返回按钮 标题
-(void)createNavigation{
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 35, 20, 20)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_cancel"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(dismissLoginVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-30, 34, 60, 20)];
    [title setLabelTextColor:[UIColor colorWithHexString:@"022323"] textFontSize:17 textAlignment:NSTextAlignmentCenter];
    title.text = @"登录";
    [self.view addSubview:title];
}
-(void)dismissLoginVC{

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 用户名密码输入框
-(void)createTextField{
    
    _phoneTf = [[LoginTextField alloc]initWithFrame:CGRectMake(15, 109, kScreenWidth-30, 50) withLeftViewSize:CGSizeMake(12, 17) withIconImage:[UIImage imageNamed:@"icon_iphone"] isBorder:YES];
    _phoneTf.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTf.placeholder = @"请输入你的手机号";
    _phoneTf.delegate = self;
    [self.view addSubview:_phoneTf];
    
    _passwordTf = [[LoginTextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_phoneTf.frame)-1, kScreenWidth-30, 50) withLeftViewSize:CGSizeMake(15, 17) withIconImage:[UIImage imageNamed:@"icon_password"] isBorder:YES];
    _passwordTf.placeholder = @"请输入你的密码(6-15位)";
    _passwordTf.secureTextEntry = YES;
    _passwordTf.delegate = self;
    [self.view addSubview:_passwordTf];
}
#pragma mark 按钮
-(void)createButton{
    // 登录
    _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_passwordTf.frame)+30, kScreenWidth-30, 49)];
    [_loginBtn setViewRadios:4 bouns:YES boderWith:0 boderColor:nil];
    [_loginBtn setButtonTitle:@"登录" titleColor:[UIColor whiteColor] titleFontSize:17 titleAlignment:UIControlContentHorizontalAlignmentCenter];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"img_btn_background"] forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    
    // 忘记密码
    _forgetPassBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_loginBtn.frame)+24, 82, 20)];
    [_forgetPassBtn setButtonTitle:@"忘记密码？" titleColor:[UIColor colorWithHexString:@"565656"] titleFontSize:16 titleAlignment:UIControlContentHorizontalAlignmentLeft];
    [_forgetPassBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [_forgetPassBtn addTarget:self action:@selector(forgetBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetPassBtn];
    
    // 短信验证码
    _codeLoginBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreenWidth-120)/2, _forgetPassBtn.y, 120, 20)];
    [_codeLoginBtn setButtonTitle:@"短信验证码登录" titleColor:[UIColor colorWithHexString:@"0062ba"] titleFontSize:16 titleAlignment:UIControlContentHorizontalAlignmentCenter];
    [_codeLoginBtn addTarget:self action:@selector(codeLoginBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_codeLoginBtn];
    
    // 立即注册
    _registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-95, _forgetPassBtn.y, 80, 20)];
    [_registerBtn setButtonTitle:@"立即注册>" titleColor:[UIColor colorWithHexString:@"0062ba"] titleFontSize:16 titleAlignment:UIControlContentHorizontalAlignmentRight];
    [_registerBtn addTarget:self action:@selector(registerBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerBtn];
}

#pragma mark UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (string.length == 0) return YES;
    NSInteger existedLength = textField.text.length;
    NSInteger selectedLength = range.length;
    NSInteger replaceLength = string.length;

    //用户名手机号输入文本
    if (textField == _phoneTf) {
        
        //限制用户名输入手机号长度为11
        if (existedLength - selectedLength + replaceLength > 11) {
            return NO;
        }
    //验证码输入文本
    }else if (textField == _passwordTf){
        
        //限制密码长度为最高为15位
        if (existedLength - selectedLength + replaceLength > 15) {
            return NO;
        }
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark 登录
-(void)loginBtnOnClick{
    
}

#pragma mark 忘记密码?
-(void)forgetBtnOnClick{
    ForgetVC *forgetVC = [[ForgetVC alloc]init];
    [self presentViewController:forgetVC animated:YES completion:nil];
}

#pragma mark 短信验证码登录
-(void)codeLoginBtnOnClick{
    CodeLoginVC *codeVC = [[CodeLoginVC alloc]init];
    [self presentViewController:codeVC animated:YES completion:nil];
}

#pragma mark 立即注册>
-(void)registerBtnOnClick{

    RegisterVC *registerVc = [[RegisterVC alloc]init];
    [self presentViewController:registerVc animated:YES completion:nil];
}
#pragma mark 收起键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_phoneTf resignFirstResponder];
    [_passwordTf resignFirstResponder];
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
