//
//  MineVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/7.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "MineVC.h"
#import "MineTVCell.h"
#import "ChangeNicknameVC.h"
#import "SettingVC.h"

@interface MineVC ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView *mineInformation;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIButton *headerBtn;

@end

@implementation MineVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"我的";
    [self hideLeftItemButton];
    
    _dataArray = @[@"昵称",@"手机号",@"设置"];
    
    [self createMnieInformationTableView];
}

-(void)createMnieInformationTableView{
    _mineInformation = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _mineInformation.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    _mineInformation.delegate = self;
    _mineInformation.dataSource = self;
    _mineInformation.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self createHeaderView];
    [self.view addSubview:_mineInformation];
}

#pragma mark 头视图头像昵称
-(void)createHeaderView{
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/15*8)];
    _headerView.userInteractionEnabled = YES;
    UIImageView *backgroundImgV = [[UIImageView alloc]initWithFrame:_headerView.bounds];
    backgroundImgV.image = [UIImage imageNamed:@"img_header_background"];
    [_headerView addSubview:backgroundImgV];
    
    // 头像
    UIImageView *userHeader = UIImageView.new;
    userHeader.image = [UIImage imageNamed:@"img_header"];
    userHeader.userInteractionEnabled = YES;
    [userHeader setViewRadios:_headerView.height/4 bouns:YES boderWith:0 boderColor:nil];
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userHeaderOnClick)];
    tgr.delegate = self;
    [userHeader addGestureRecognizer:tgr];
    [_headerView addSubview:userHeader];
    
    // 昵称
    UILabel *nickName = UILabel.new;
    nickName.text = @"小明";
    [nickName setLabelTextColor:[UIColor whiteColor] textFontSize:15 textAlignment:NSTextAlignmentCenter];
    [_headerView addSubview:nickName];
    // masonry 布局
    [userHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_headerView);
        make.size.mas_equalTo(CGSizeMake(_headerView.height/2, _headerView.height/2));
    }];
    
    [nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_headerView);
        make.top.mas_equalTo(userHeader.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth/2, 20));
    }];
    
    _mineInformation.tableHeaderView = _headerView;
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"third_cell";
    MineTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MineTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.title.text = _dataArray[indexPath.row];
    switch (indexPath.row) {
        case 0:
        {
            cell.subTitle.hidden = NO;
            cell.icon_arrow.hidden = NO;
            cell.subTitle.text = @"小明";
        }
            break;
        case 1:
        {
            cell.subTitle.hidden = NO;
            cell.icon_arrow.hidden = YES;
            cell.subTitle.text = @"15154397626";
        }
            break;
        case 2:
        {
            cell.subTitle.hidden = YES;
            cell.icon_arrow.hidden = NO;
        }
            break;
            
        default:
            break;
    }    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            ChangeNicknameVC *change = [[ChangeNicknameVC alloc]init];
            change.nickName = @"小明";
            [self.navigationController pushViewController:change animated:YES];
        }
            break;
        case 1:
        {

        }
            break;
        case 2:
        {
            SettingVC *setting = [[SettingVC alloc]init];
            [self.navigationController pushViewController:setting animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}

-(void)userHeaderOnClick{

    LoginVC *login = [[LoginVC alloc]init];
    [self presentViewController:login animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


