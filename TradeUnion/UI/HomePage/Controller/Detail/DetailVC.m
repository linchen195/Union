//
//  DetailVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/18.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "DetailVC.h"
#import "DetailHeaderView.h"
#import "DetailCommentTVCell.h"
#import "DetailCommentModel.h"
#import "DetailBottomCommentView.h"

@interface DetailVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *detailTableView;

@property (nonatomic,strong) DetailHeaderView *headerView;

@property (nonatomic,strong) NSMutableArray *dataArray;

// 键盘
@property (nonatomic, strong) LZBKeyBoardToolEmojiBar *keyboardView ;

@end

@implementation DetailVC

#pragma mark 懒加载 键盘
- (LZBKeyBoardToolEmojiBar *)keyboardView
{
    if(_keyboardView == nil)
    {
        __weak typeof(self) weakSelf = self;
        _keyboardView = [LZBKeyBoardToolEmojiBar showKeyBoardWithConfigToolBarHeight:0 sendTextCompletion:^(NSString *sendText) {
            
            [weakSelf insertComment:sendText];
        }];
        [_keyboardView  setInputViewPlaceHolderText:@"请输入文字"];
    }
    return _keyboardView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情";

    [self loadData];
    [self createTableView];
    [self createCommentView];
    
    // 添加键盘
    [self.view addSubview:self.keyboardView];
    _keyboardView.hidden = YES;
}
-(void)createTableView{

    _detailTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) style:UITableViewStylePlain];
    _detailTableView.dataSource = self;
    _detailTableView.delegate = self;
    _detailTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_detailTableView];
    
    _headerView = [[DetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    _detailTableView.tableHeaderView = _headerView;
}
#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"comment_cell";

    DetailCommentTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[DetailCommentTVCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    DetailCommentModel *model = [[DetailCommentModel alloc]initWithDic:_dataArray[indexPath.row]];
    cell.model = model;
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailCommentTVCell *cell = (DetailCommentTVCell *)[self tableView:_detailTableView cellForRowAtIndexPath:indexPath];

    return [cell calculateCellHeight];
}

#pragma mark 添加新的评论
-(void)insertComment:(NSString *)commentStr{
    // 获取当前时间戳
    NSDate *senddate = [NSDate date];
    NSString *currentDate = [NSString stringWithFormat:@"%f",[senddate timeIntervalSince1970]];

    // 去除字符串两端空格
    NSString *string = [commentStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSDictionary *dic = @{@"userHead":@"img_header",@"nickname":@"小明",@"commentContent":string,@"commentTime":currentDate,};
    [_dataArray insertObject:dic atIndex:0];

    // 插入第一格评论数据
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    NSArray *insertIndexPaths = [NSArray arrayWithObjects:indexPath,nil];
    [_detailTableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationBottom];
}

-(void)loadData{
    _dataArray = [[NSMutableArray alloc]initWithArray:@[
                   @{@"userHead":@"img_header",@"nickname":@"小明",@"commentContent":@"第一个，真是太好了！重要的事情要说三遍！",@"commentTime":@"1487840579",},
                   @{@"userHead":@"img_header",@"nickname":@"小明",@"commentContent":@"第二个，真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！重要的事情要说三遍！",@"commentTime":@"1487840579",},
                   @{@"userHead":@"img_header",@"nickname":@"小明",@"commentContent":@"第三个，真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！真是太好了！重要的事情要说三遍！",@"commentTime":@"1487840579",},
                   @{@"userHead":@"img_header",@"nickname":@"小明",@"commentContent":@"第四个，真是太好了！真是太好了！真是太好了！真是太好了！重要的事情要说三遍！",@"commentTime":@"1487840579",},
                   ]];
}

#pragma mark 底部评论视图
-(void)createCommentView{
    
    DetailBottomCommentView *bottomView = [[DetailBottomCommentView alloc]initWithFrame:CGRectMake(0, kScreenHeight-50, kScreenWidth, 50)];
    [bottomView.commentIconBtn addTarget:self action:@selector(showKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [bottomView.tap addTarget:self action:@selector(showKeyBoard)];
    [self.view addSubview:bottomView];
}

-(void)showKeyBoard{
    _keyboardView.hidden = NO;
    [_keyboardView becomeFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_keyboardView resignFirstResponder];
    _keyboardView.hidden = YES;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_keyboardView resignFirstResponder];
    _keyboardView.hidden = YES;
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
