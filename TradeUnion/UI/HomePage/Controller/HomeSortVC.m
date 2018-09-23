//
//  HomeSortVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/12.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "HomeSortVC.h"
#import "HomeTVModel.h"
#import "BookListView.h"
#import "DetailVC.h"

@interface HomeSortVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArr;

@end

@implementation HomeSortVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (_dataArr.count==0) {
        [_tableView.mj_header beginRefreshing];
    }else{}
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self createNavigation];
    
    switch (_homeSortVCStyle) {
        case 0:
        {[self createTableView];}
            break;
        case 1:
        {[self createBookCollectionView];}
            break;
        default:
            break;
    }
}

// 假数据
-(void)createData{
    
    NSDictionary *dic0 = [[NSDictionary alloc]init];
    dic0 = @{
             @"thumbnail":@"img_newwind",
             @"title":@"滨州市工会一线职工修养活动启动仪式",
             @"publishTime":@"2016-12-08",
             @"commentNum":@"666"};
    NSArray *rowArray0 = [[NSArray alloc]initWithObjects:dic0,dic0,dic0,dic0,dic0,dic0,dic0, nil];
    
    _dataArr = [[NSArray alloc]initWithArray:rowArray0];
    [_tableView reloadData];
    [_tableView.mj_header endRefreshing];
}
#pragma mark 导航栏
-(void)createNavigation{
    self.title = _vcTitle;
    self.popShowTabBar = YES;
}
#pragma mark 主表视图
-(void)createTableView{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:242/255.0 alpha:1];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self createMJRefresh];
    [self.view addSubview: _tableView];
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"cell";
    HomePageTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[HomePageTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    HomeTVModel *model = [[HomeTVModel alloc]initWithDic:[_dataArr objectAtIndex:indexPath.row]];
    
    cell.model = model;
    
    return cell;
}

#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailVC *detail = [[DetailVC alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
}
// 单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (kScreenWidth-30)/3/3*2+20;
}

#pragma mark 跳转为书刊亭时
-(void)createBookCollectionView{
    BookListView *bookView = [[BookListView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withListImageAndTitle:@{@"title":@"《两学一做》",@"img":@"img_book"} withEveryLineNum:3];
    bookView.bookCollectView.scrollEnabled = YES;
    [self.view addSubview:bookView];
}

-(void)createMJRefresh{
    // 下拉刷新
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(createData)];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"努力加载中..." forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    _tableView.mj_header = header;
    // 上拉加载
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(createData)];
    footer.automaticallyChangeAlpha = YES;
    footer.automaticallyHidden = YES;
    _tableView.mj_footer = footer;
    [footer setTitle:@"已经加载完毕" forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"努力加载中..." forState:MJRefreshStateRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
