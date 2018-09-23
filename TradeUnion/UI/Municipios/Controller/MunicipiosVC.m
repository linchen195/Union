//
//  MunicipiosVC.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/7.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "MunicipiosVC.h"
#import "BtnCollectionView.h"

@interface MunicipiosVC ()<BtnCollectionViewDelegate>

@property (nonatomic,strong) BtnCollectionView *btncollectionView;

@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation MunicipiosVC

static NSString *cell_identy = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"县区";
    [self hideLeftItemButton];
    
    [self createMunicipionsCollectionView];
    
    [self createColloctionView];
}

-(void)createMunicipionsCollectionView{
    
    NSArray *array = @[@{@"title":@"滨城区",@"img":@"icon_bincheng"},@{@"title":@"北海区",@"img":@"icon_beihai"},@{@"title":@"高新区",@"img":@"icon_gaoxin"},@{@"title":@"开发区",@"img":@"icon_kaifa"},@{@"title":@"沾化区",@"img":@"icon_zhanhua"},@{@"title":@"惠民县",@"img":@"icon_huimin"},@{@"title":@"博兴县",@"img":@"icon_boxing"},@{@"title":@"无棣县",@"img":@"icon_wudi"},@{@"title":@"阳信县",@"img":@"icon_yangxin"},@{@"title":@"邹平县",@"img":@"icon_zouping"}];
    _dataArray = array;
    
}
-(void)createColloctionView{
    
    _btncollectionView = [[BtnCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withEverLineNum:3 withImgAndTitleArray:_dataArray withImgRadios:3];
    _btncollectionView.btncollectionView.scrollEnabled = YES;
    _btncollectionView.delegate = self;
    [self.view addSubview:_btncollectionView];
}
#pragma mark BtnCollectionViewDelegate
-(void)buttonOnClickWithButtonIndex:(NSInteger)index{

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
