//
//  changePasswordVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/15.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "ChangePasswordVC.h"

@interface ChangePasswordVC ()

@end

@implementation ChangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createSubViews];
}

-(void)createSubViews{
    // 密码
    UILabel *passText = [self createLabelWithFrame:CGRectMake(15, 79, (kScreenWidth-30)/7*2, 35) withText:@"密码"];
    [self.view addSubview:passText];
    UITextField *passTF = [self createTextFieldWithFrame:CGRectMake(CGRectGetMaxX(passText.frame), passText.y, (kScreenWidth-30)/7*5, passText.height) withPlaceHolderText:@"请输入密码"];
    [self.view addSubview:passTF];
    // 确认密码
    UILabel *surePass = [self createLabelWithFrame:CGRectMake(15, CGRectGetMaxY(passText.frame)+10, passText.width, passText.height) withText:@"确认密码"];
    [self.view addSubview:surePass];
    UITextField *surePassTF = [self createTextFieldWithFrame:CGRectMake(CGRectGetMaxX(surePass.frame), surePass.y, passTF.width, passText.height) withPlaceHolderText:@"请再次输入密码"];
    [self.view addSubview:surePassTF];
    // 确认按钮
    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(surePass.frame)+15, kScreenWidth-30, 45)];
    [sureBtn setViewRadios:5 bouns:YES boderWith:0 boderColor:nil];
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"img_btn_background"] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
}

-(UILabel *)createLabelWithFrame:(CGRect)frame withText:(NSString *)textStr{
    UILabel *title = [[UILabel alloc]initWithFrame:frame];
    title.text = textStr;
    [title setLabelTextColor:[UIColor colorWithHexString:@"656565"] textFontSize:17 textAlignment:NSTextAlignmentLeft];
    
    return title;
}

-(UITextField *)createTextFieldWithFrame:(CGRect)frame withPlaceHolderText:(NSString *)textStr{
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:frame];
    textfield.font = [UIFont systemFontOfSize:17];
    NSDictionary * dic=@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"414141"]};
    textfield.attributedPlaceholder = [[NSAttributedString alloc]initWithString:textStr attributes:dic];
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;

    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, textfield.height-1, textfield.width, 1)];
    line.backgroundColor = [UIColor colorWithHexString:@"b2d1e9"];
    [textfield addSubview:line];
    
    return textfield;
}

-(void)sureBtnOnClick{
    NSLog(@"确认修改");
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
