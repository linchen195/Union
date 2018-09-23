//
//  SearchVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/16.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "SearchVC.h"

@interface SearchVC () <UITextFieldDelegate>

@property (nonatomic,strong) UITextField *searchTf;
@property (nonatomic,strong) UIButton *cancelBtn;

@end

@implementation SearchVC

#pragma mark 导航栏
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationItem setHidesBackButton:YES];
    self.navigationController.navigationBar.hidden = YES;
    [_searchTf becomeFirstResponder];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    
    [self hideLeftItemButton];
    self.title = nil;
    
    [self createTextField];
}

-(void)createTextField{
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    titleView.backgroundColor = [UIColor colorWithHexString:@"0062ba"];
    
    // 搜索框
    _searchTf = [[UITextField alloc]initWithFrame:CGRectMake(15, 27.5, kScreenWidth-80, 29)];
    [_searchTf setViewRadios:5 bouns:YES boderWith:0 boderColor:nil];
    _searchTf.backgroundColor = [UIColor whiteColor];
    _searchTf.placeholder = @"输入您的关键字";
    _searchTf.font = [UIFont systemFontOfSize:15];
    _searchTf.delegate = self;
    _searchTf.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchTf.returnKeyType = UIReturnKeySearch;
    [titleView addSubview:_searchTf];
    UIView *tfLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 29)];
    tfLeftView.backgroundColor = [UIColor whiteColor];
    _searchTf.leftView = tfLeftView;
    _searchTf.leftViewMode = UITextFieldViewModeAlways;
    
    // 取消按钮
    _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_searchTf.frame)+10, 32, 40, 20)];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [_cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:_cancelBtn];
    [self.view addSubview:titleView];
}

-(void)popBack{
    [self.navigationController popViewControllerAnimated:NO];
}
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_searchTf resignFirstResponder];
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
