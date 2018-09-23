//
//  BaseViewController.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/7.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 导航栏背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"0062ba"]];
    // 导航栏字体颜色
    NSDictionary * dic=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.titleTextAttributes=dic;
    
    self.title = @"";
    
    // 左侧返回按钮
    //重写返回按钮的frame
    UIView *leftItemV = [[UIView alloc] initWithFrame:CGRectMake(5, 7, 45, 45)];
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(0, 15/2.0, 30, 30)];
    [back setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    
    [back addTarget:self action:@selector(popDiyView) forControlEvents:UIControlEventTouchUpInside];
    [leftItemV addSubview:back];
    
    _leftItemV =leftItemV;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftItemV];
    
}
-(void)popDiyView{
    
    [self.navigationController popViewControllerAnimated:YES];
   
}

-(void)hideLeftItemButton{
    _leftItemV.hidden = YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
        
}


@end
