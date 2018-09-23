//
//  SettingVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/14.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "SettingVC.h"
#import "MineTVCell.h"
#import "AboutUnionVC.h"
#import "ChangePasswordVC.h"

@interface SettingVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    _dataArray = @[@"修改密码",@"关于滨州工会"];
    [self createSubViews];
}

-(void)createSubViews{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [self.view addSubview:_tableView];
    
    // 上边线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    line.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [_tableView addSubview:line];
}


#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"set_cell";
    
    MineTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MineTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.title.text = _dataArray[indexPath.row];
    cell.title.textColor = [UIColor colorWithHexString:@"333333"];
    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {   // 修改密码
            ChangePasswordVC *change = [[ChangePasswordVC alloc]init];
            [self.navigationController pushViewController:change animated:YES];
        }
            break;
        case 1:
        {   // 关于滨州工会
            AboutUnionVC *about = [[AboutUnionVC alloc]init];
            [self.navigationController pushViewController:about animated:YES];
        }
            break;
        default:
            break;
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
