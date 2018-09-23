//
//  ToolsVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/7.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "ToolsVC.h"
#import "ToolCollectionViewCell.h"

@interface ToolsVC () <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *toolCollectionView;

@end

@implementation ToolsVC
static NSString *cell_identy = @"tool_cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"工具";
    [self hideLeftItemButton];
    
    [self createColleciontView];
}

-(void)createColleciontView{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kScreenWidth/3, kScreenWidth/3/6*5);
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    _toolCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout: layout];
    _toolCollectionView.delegate = self;
    _toolCollectionView.dataSource = self;
    _toolCollectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_toolCollectionView];
    
    // 上边线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    line.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [_toolCollectionView addSubview:line];
    /**
     *  将UICollectionViewCell类的单元格 加上 cell_identy复用标记
     */
    [_toolCollectionView registerClass:[ToolCollectionViewCell class] forCellWithReuseIdentifier:cell_identy];
}

#pragma mark UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ToolCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_identy forIndexPath:indexPath];
    cell.imageView.backgroundColor = [UIColor greenColor];
    cell.title.backgroundColor = [UIColor yellowColor];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
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
