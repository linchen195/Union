//
//  HomePageVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/7.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "HomePageVC.h"
#import "HeaderView.h"
#import "HomeTVModel.h"
#import "HomeSortVC.h"
#import "BookTableViewCell.h"
#import "SearchVC.h"
#import "DetailVC.h"

@interface HomePageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *homeTableView;

@property (nonatomic,strong) NSArray *sortArr;

@property (nonatomic,strong) NSMutableArray *dataDic;
// 单元格高度
@property (nonatomic,assign) CGFloat cellHeight;
@end

@implementation HomePageVC
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (_dataDic.count==0) {
        [_homeTableView.mj_header beginRefreshing];
    }else{}
}
-(void)viewDidLoad{
    [super viewDidLoad];

    self.title = @"滨州总工会";
    
    [self setNavigation];
    
    _sortArr = [NSArray arrayWithObjects: @"新视窗",@"书刊亭",@"民星榜",@"减压舱",@"欢乐谷",@"福利街",@"工会院",@"创客园", nil];
    
    [self createMainTableView];
}
#pragma mark -- 设置导航栏
-(void)setNavigation{
    
    [self hideLeftItemButton];
    //重写返回按钮的frame
    UIView *rightItemV = [[UIView alloc] initWithFrame:CGRectMake(5, 7, 45, 45)];
    
    UIButton *search = [UIButton buttonWithType:UIButtonTypeCustom];
    [search setFrame:CGRectMake(15, 15/2.0, 30, 30)];
    [search setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [search addTarget:self action:@selector(navigationSearchButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightItemV addSubview:search];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightItemV];
}
-(void)navigationSearchButtonOnClick{
    
    SearchVC *search = [[SearchVC alloc]init];
    [self.navigationController pushViewController:search animated:NO];
}
#pragma mark -- 加载假数据
-(void)loadDeathData{
    _dataDic = [[NSMutableArray alloc]init];
    NSDictionary *dic0 = [[NSDictionary alloc]init];
    dic0 = @{
                @"thumbnail":@"img_newwind",
                @"title":@"滨州市工会一线职工修养活动启动仪式",
                @"publishTime":@"2016-12-08",
                @"commentNum":@"666"};
    NSArray *rowArray0 = [[NSArray alloc]initWithObjects:dic0,dic0,dic0,dic0,dic0,dic0, nil];
    
    NSDictionary *dic1 = [[NSDictionary alloc]init];
    dic1 = @{
             @"thumbnail":@"img_book",
             @"title":@"滨州市工会一线职工修养活动启动仪式",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray1 = [[NSArray alloc]initWithObjects:dic1,dic1,dic1,dic1,dic1,dic1, nil];

    NSDictionary *dic2 = [[NSDictionary alloc]init];
    dic2 = @{
             @"thumbnail":@"img_pepstar",
             @"title":@"滨州市工会一线职工修养活动启动仪式",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray2 = [[NSArray alloc]initWithObjects:dic2,dic2,dic2,dic2,dic2,dic2, nil];

    NSDictionary *dic3 = [[NSDictionary alloc]init];
    dic3 = @{
             @"thumbnail":@"img_relief",
             @"title":@"滨州市工会一线职工修养活动启动仪式",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray3 = [[NSArray alloc]initWithObjects:dic3,dic3,dic3,dic3,dic3,dic3, nil];
    
    NSDictionary *dic4 = [[NSDictionary alloc]init];
    dic4 = @{
             @"thumbnail":@"img_happy",
             @"title":@"滨州市工会一线职工修养活动启动仪式",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray4 = [[NSArray alloc]initWithObjects:dic4,dic4,dic4,dic4,dic4,dic4, nil];
    
    NSDictionary *dic5 = [[NSDictionary alloc]init];
    dic5 = @{
             @"thumbnail":@"img_benefits",
             @"title":@"滨州市工会一线职工修养活动启动仪式",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray5 = [[NSArray alloc]initWithObjects:dic5,dic5,dic5,dic5,dic5,dic5, nil];

    NSDictionary *dic6 = [[NSDictionary alloc]init];
    dic6 = @{
             @"thumbnail":@"img_uinion",
             @"title":@"滨州市工会一线职工修养活动启动仪式",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray6 = [[NSArray alloc]initWithObjects:dic6,dic6,dic6,dic6,dic6,dic6, nil];
    
    NSDictionary *dic7 = [[NSDictionary alloc]init];
    dic7 = @{
             @"thumbnail":@"img_guest",
             @"title":@"创客园",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray7 = [[NSArray alloc]initWithObjects:dic7,dic7,dic7,dic7,dic7,dic7, nil];
    
    [_dataDic addObjectsFromArray: @[rowArray0,rowArray1,rowArray2,rowArray3,rowArray4,rowArray5,rowArray6,rowArray7]];
    [_homeTableView reloadData];
    
    [_homeTableView.mj_header endRefreshing];
}

#pragma mark -- 创建首页主表视图
- (void)createMainTableView{
    
    _homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    _homeTableView.dataSource = self;
    _homeTableView.delegate = self;
    _homeTableView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:242/255.0 alpha:1];
    _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _homeTableView.showsVerticalScrollIndicator = NO;
    [self createMJRefresh];

    HeaderView *headerView = [[HeaderView alloc]init];
    
    _homeTableView.tableHeaderView = headerView;
    
    [self.view addSubview:_homeTableView];
}

#pragma mark UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataDic.count;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = _dataDic[section];
    return section==1?1:array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        static NSString *identifier = @"book_cell";
        BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[BookTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        _cellHeight = [cell cellHeight];
        return cell;
    }else{
        static NSString *identifier = @"main_cell";
        HomePageTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[HomePageTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        _cellHeight = [cell cellHeight];
        
        NSArray *array = [_dataDic objectAtIndex:indexPath.section];
        
        HomeTVModel *model = [[HomeTVModel alloc]  initWithDic:[array objectAtIndex: indexPath.row]];
        cell.model = model;
        
        return cell;
    }
}
#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section==1) {
        
    }else{
        DetailVC *detail = [[DetailVC alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
    }
}
// 单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{    
    return _cellHeight;
}

// 头尾视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}
// 头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *sectionHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    
    // 灰色的分割view
    UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 5)];
    grayView.backgroundColor = [UIColor colorWithHexString:@"f1f1f1"];
    [sectionHeader addSubview: grayView];
    
    // 分类 标题 更多按钮
    UIView *sortView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(grayView.frame), kScreenWidth, 35)];
    sortView.backgroundColor = [UIColor whiteColor];
    [sectionHeader addSubview:sortView];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(15, 10, 2, 15)];
    line.backgroundColor = [UIColor colorWithHexString:@"fe3c3a"];
    [sortView addSubview:line];
    
    UILabel *sortTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(line.frame)+5, 8, kScreenWidth/2, 19)];
    sortTitle.font = [UIFont systemFontOfSize:17];
    sortTitle.textAlignment = NSTextAlignmentLeft;
    sortTitle.textColor = [UIColor colorWithHexString:@"323232"];
    [sortView addSubview:sortTitle];
    sortTitle.text = _sortArr[section];
    
    // 更多按钮
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-55, 10, 40, 17)];
    moreBtn.tag = section+13579;
    [moreBtn addTarget:self action:@selector(moreBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [moreBtn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
    [sortView addSubview:moreBtn];
    
    return sectionHeader;
}

// 点击更多按钮
-(void)moreBtnOnclick:(UIButton *)moreBtn{
    
    HomeSortVC *homeSort = [[HomeSortVC alloc]init];
    homeSort.vcTitle = _sortArr[moreBtn.tag-13579];
    
    if (moreBtn.tag-13579 == 1) {
        homeSort.homeSortVCStyle = HomeSortVCStyleCollectionView;
    }else{
        homeSort.homeSortVCStyle = HomeSortVCStyleTableView;
    }
    
    [self.navigationController pushViewController:homeSort animated:YES];
}

-(void)createMJRefresh{
    // 下拉刷新
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDeathData)];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"努力加载中..." forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    _homeTableView.mj_header = header;
    
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
