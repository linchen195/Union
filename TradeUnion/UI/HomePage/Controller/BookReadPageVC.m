//
//  BookReadPage.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/13.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BookReadPageVC.h"
//#import "LSYReadViewController.h"
#import "LSYReadPageViewController.h"
//#import "LSYReadUtilites.h"
#import "LSYReadModel.h"

@interface BookReadPageVC ()

@property (nonatomic,strong) UIImageView *bookThumbnail;

@property (nonatomic,strong) UILabel *bookIntroduct;

@property (nonatomic,strong) UIButton *startReadButton;

@property (nonatomic,strong) UIActivityIndicatorView *activity;


@end

@implementation BookReadPageVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"书刊亭";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubViews];
}

-(void)createSubViews{
    
    // 图书缩略图
    _bookThumbnail = UIImageView.new;
    _bookThumbnail.image = [UIImage imageNamed:@"img_book"];
    [self.view addSubview:_bookThumbnail];
    
    // 图书简介
    _bookIntroduct = UILabel.new;
    _bookIntroduct.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_bookIntroduct];
    
    // 开始阅读按钮
    _startReadButton = UIButton.new;
    _startReadButton.backgroundColor = [UIColor colorWithHexString:@"0062ba"];
    [_startReadButton setViewRadios:3 bouns:YES boderWith:0 boderColor:nil];
    [_startReadButton setTitle:@"开始阅读" forState:UIControlStateNormal];
    [_startReadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_startReadButton addTarget:self action:@selector(startRead) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_startReadButton];
    
    __weak typeof (self) weakSelf = self;
    UIView *superview = weakSelf.view;
    
    [_bookThumbnail mas_makeConstraints:^(MASConstraintMaker *make) {
        // chain attributes
        make.top.equalTo(superview.mas_top).offset(79);
        make.left.equalTo(superview.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth/3-15, (kScreenWidth/3-15)/3*4));
    }];
    
    [_bookIntroduct mas_makeConstraints:^(MASConstraintMaker *make) {
        // chain attributes
        make.top.equalTo(superview.mas_top).offset(79);
        
        make.left.equalTo(_bookThumbnail.mas_right).offset(10);
        
        make.right.equalTo(superview.mas_right).offset(-15);
        
        make.height.equalTo(_bookThumbnail.mas_height);
    }];
    
    [_startReadButton mas_makeConstraints:^(MASConstraintMaker *make) {                        
        // chain attributes
        make.top.equalTo(_bookThumbnail.mas_bottom).offset(15);
        make.centerX.equalTo(superview);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth-30, 50));
    }];
}

-(void)startRead{

    [_activity startAnimating];
    
    LSYReadPageViewController *pageView = [[LSYReadPageViewController alloc] init];
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"mdjyml"withExtension:@"txt"];
    pageView.resourceURL = fileURL;    //文件位置
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        pageView.model = [LSYReadModel getLocalModelWithURL:fileURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_activity stopAnimating];
            //             [_begin setTitle:@"Beign txt Read" forState:UIControlStateNormal];
            //            [_beginEpub setEnabled:YES];
            
            [self presentViewController:pageView animated:YES completion:nil];
        });
    });
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
