//
//  ForgetVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/20.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "ForgetVC.h"

#define kNumbers @"0123456789"

@interface ForgetVC () <UITextFieldDelegate>

@property (nonatomic,strong) LoginTextField *phoneTf;
@property (nonatomic,strong) LoginTextField *codeTf;
@property (nonatomic,strong) LoginTextField *passwordTf;
@property (nonatomic,strong) LoginTextField *surePassTf;

@property (nonatomic,strong) UIButton *getCodeBtn;

@property (nonatomic,strong) UIButton *sureBtn;

@end

@implementation ForgetVC

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
    
    [self createSubviews];
}

#pragma mark 返回按钮 标题
-(void)createNavigation{
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 35, 20, 20)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_cancel"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(dismissLoginVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2-50, 34, 100, 20)];
    [title setLabelTextColor:[UIColor colorWithHexString:@"022323"] textFontSize:17 textAlignment:NSTextAlignmentCenter];
    title.text = @"忘记密码";
    [self.view addSubview:title];
}

-(void)dismissLoginVC{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 输入框 按钮
-(void)createSubviews{

    // 手机号 和 获取验证码按钮
    UIView *phoneView = [[UIView alloc]initWithFrame:CGRectMake(15, 109-1, kScreenWidth-30, 50)];
    [phoneView setViewRadios:0 bouns:YES boderWith:1 boderColor:[UIColor colorWithHexString:@"e1e1e1"]];
    [self.view addSubview:phoneView];
        // 手机号
    _phoneTf = [[LoginTextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-30-110, 50) withLeftViewSize:CGSizeMake(12, 17) withIconImage:[UIImage imageNamed:@"icon_iphone"] isBorder:NO];
    _phoneTf.placeholder = @"请输入你的手机号";
    _phoneTf.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTf.delegate = self;
    [phoneView addSubview:_phoneTf];
        // 获取验证码按钮
    _getCodeBtn = [[UIButton alloc]initWithFrame:CGRectMake(phoneView.width-110, 0, 110, 50)];
    [_getCodeBtn setButtonTitle:@"获取验证码" titleColor:[UIColor colorWithHexString:@"656565"] titleFontSize:16 titleAlignment:UIControlContentHorizontalAlignmentCenter];
    [_getCodeBtn addTarget:self action:@selector(getCodeBtnCountdown) forControlEvents:UIControlEventTouchUpInside];
    [phoneView addSubview:_getCodeBtn];
        // 竖线分割线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(phoneView.width-_getCodeBtn.width, 13, 1, 24)];
    line.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [phoneView addSubview:line];

    // 验证码
    _codeTf = [[LoginTextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(phoneView.frame)-1, kScreenWidth-30, 50) withLeftViewSize:CGSizeMake(17, 16) withIconImage:[UIImage imageNamed:@"icon_coding"] isBorder:YES];
    _codeTf.placeholder = @"请输入您获取的验证码";
    _codeTf.keyboardType = UIKeyboardTypeNumberPad;
    _codeTf.delegate = self;
    [self.view addSubview:_codeTf];
    
    // 密码
    _passwordTf = [[LoginTextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_codeTf.frame)-1, kScreenWidth-30, 50) withLeftViewSize:CGSizeMake(15, 17) withIconImage:[UIImage imageNamed:@"icon_password"] isBorder:YES];
    _passwordTf.placeholder = @"请输入你的密码(6-15位)";
    _passwordTf.secureTextEntry = YES;
    _passwordTf.delegate = self;
    [self.view addSubview:_passwordTf];
    // 确认密码
    _surePassTf = [[LoginTextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_passwordTf.frame)-1, kScreenWidth-30, 50) withLeftViewSize:CGSizeMake(15, 17) withIconImage:[UIImage imageNamed:@"icon_password"] isBorder:YES];
    _surePassTf.placeholder = @"再次输入新密码";
    _surePassTf.secureTextEntry = YES;
    _surePassTf.delegate = self;
    [self.view addSubview:_surePassTf];
    
    // 确定按钮
    _sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_surePassTf.frame)+30, kScreenWidth-30, 49)];
    [_sureBtn setButtonTitle:@"确定" titleColor:[UIColor whiteColor] titleFontSize:17 titleAlignment:UIControlContentHorizontalAlignmentCenter];
    [_sureBtn setBackgroundImage:[UIImage imageNamed:@"img_btn_background"] forState:UIControlStateNormal];
    [self.view addSubview:_sureBtn];
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
    }else if (textField == _codeTf){
        
        //限制验证码长度为6
        if (existedLength - selectedLength + replaceLength > 6) {
            return NO;
        }
    //密码输入文本
    }else if (textField == _passwordTf||textField == _surePassTf){
        
        //限制密码长度为最高为15位
        if (existedLength - selectedLength + replaceLength > 15) {
            return NO;
        }
    }
    return YES;
}
// 点击return 收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -- 获取验证码倒计时
-(void)getCodeBtnCountdown{
    
    _getCodeBtn.enabled = NO;
    __block int timeout = 60; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);//每秒执行一次
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){
            dispatch_source_cancel(_timer);
            //            dispatch_release(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                _getCodeBtn.enabled = YES;
                [_getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [_getCodeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            });//根据需求设置0
        }else{
            
            NSString * strTime = [NSString stringWithFormat:@"倒计时%d秒",timeout];
            dispatch_async(dispatch_get_main_queue(), ^{
                [_getCodeBtn setTitle:strTime forState:UIControlStateNormal];
                [_getCodeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

#pragma mark 收起键盘
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideKeyBoard];
}
- (void)hideKeyBoard{
    [_phoneTf resignFirstResponder];
    [_passwordTf resignFirstResponder];
    [_surePassTf resignFirstResponder];
    [_codeTf resignFirstResponder];
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
