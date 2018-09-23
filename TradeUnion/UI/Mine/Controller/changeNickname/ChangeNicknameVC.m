//
//  ChangePasswordVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/14.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "ChangeNicknameVC.h"

@interface ChangeNicknameVC ()

@property (nonatomic,strong) UITextField *changeNickname;

@end

@implementation ChangeNicknameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改昵称";
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    [self createSubViews];
    [self popShowTabBar];
}

-(void)createSubViews{

    _changeNickname = [[UITextField alloc]initWithFrame:CGRectMake(0, 84, kScreenWidth, 45)];
    _changeNickname.clearButtonMode = UITextFieldViewModeWhileEditing;
    [_changeNickname setViewRadios:0 bouns:YES boderWith:1 boderColor:[UIColor colorWithHexString:@"e1e1e1"]];
    _changeNickname.backgroundColor = [UIColor whiteColor];
    _changeNickname.font = [UIFont systemFontOfSize:15];
    _changeNickname.text = _nickName;
    [self.view addSubview:_changeNickname];
    
    // 左右空格间距
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 45)];
    paddingView.backgroundColor = [UIColor whiteColor];
    _changeNickname.leftView = paddingView;
    _changeNickname.leftViewMode = UITextFieldViewModeAlways;
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
