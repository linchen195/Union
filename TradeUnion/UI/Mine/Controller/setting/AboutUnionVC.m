//
//  AboutUnionVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/15.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "AboutUnionVC.h"
#import "MineTVCell.h"

@interface AboutUnionVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *abountTableView;

@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation AboutUnionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于滨州工会";
    self.view.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    _dataArray = @[@"功能介绍",@"系统通知",@"反馈"];
    [self createSubViews];
}

-(void)createSubViews{

    _abountTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _abountTableView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    _abountTableView.dataSource = self;
    _abountTableView.delegate = self;
    _abountTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _abountTableView.rowHeight = 50;
    [self.view addSubview:_abountTableView];
    
    // 上边线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    line.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [_abountTableView addSubview:line];

}
#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"about_cell";
    MineTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MineTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.title.textColor = [UIColor colorWithHexString:@"333333"];
    cell.title.text = _dataArray[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
