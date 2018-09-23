//
//  HeaderView.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/9.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "HeaderView.h"
#import "Viwepager.h"
#import "BtnCollectionView.h"
#import "HomeSortVC.h"
#import "SDCycleScrollView.h"

@interface  HeaderView() <BtnCollectionViewDelegate,SDCycleScrollViewDelegate>

@property (nonatomic,strong) NSArray *sortArr;

@end

@implementation HeaderView

-(instancetype)init{
    if (self = [super init]) {
        
        [self creatCycleScrollView];
    }
    return self;
}

// 轮播滑动视图
-(void)creatCycleScrollView{
    
    NSArray *array = [NSArray arrayWithObjects:@"img_lunbo",@"img_lunbo",@"img_lunbo",@"img_lunbo",nil];
    SDCycleScrollView *cycleScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/2) shouldInfiniteLoop:YES imageNamesGroup:array];
    cycleScroll.delegate = self;
    cycleScroll.pageDotColor = [UIColor colorWithHexString:@"a7a7a7"];
    cycleScroll.currentPageDotColor = [UIColor colorWithHexString:@"fc3c3a"];
    cycleScroll.pageControlDotSize = CGSizeMake(7.5, 7.5);
    cycleScroll.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScroll.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cycleScroll.autoScrollTimeInterval = 3;
    [self addSubview:cycleScroll];    
    
    NSArray *array2 = @[@{@"img":@"btn_home_newwind",@"title":@"新视窗"},@{@"img":@"btn_home_book",@"title":@"书刊亭"},@{@"img":@"btn_home_pepstar",@"title":@"民星榜"},@{@"img":@"btn_home_relief",@"title":@"减压舱"},@{@"img":@"btn_home_happy",@"title":@"欢乐谷"},@{@"img":@"btn_home_benefits",@"title":@"福利街"},@{@"img":@"btn_home_union",@"title":@"工会院"},@{@"img":@"btn_home_guest",@"title":@"创客园"}];
    _sortArr = [NSArray arrayWithObjects: @"新视窗",@"书刊亭",@"民星榜",@"减压舱",@"欢乐谷",@"福利街",@"工会院",@"创客园", nil];
    
    BtnCollectionView *buttonView = [[BtnCollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(cycleScroll.frame), kScreenWidth, (kScreenWidth/4/2+30)*2+15*3) withEverLineNum:4 withImgAndTitleArray: array2 withImgRadios:kScreenWidth/4/2/2];
    buttonView.delegate = self;
    [self addSubview:buttonView];
    
    self.frame = CGRectMake(0, 0, kScreenWidth, cycleScroll.height+buttonView.height);
}

#pragma mark BtnCollectionViewDelegate
-(void)buttonOnClickWithButtonIndex:(NSInteger)index{
    
    HomeSortVC *homeSort = [[HomeSortVC alloc]init];
    homeSort.vcTitle = _sortArr[index];
    if (index==1) {
        // 书刊亭
        homeSort.homeSortVCStyle = HomeSortVCStyleCollectionView;
    }else{
        // 除去书刊亭外其他表视图
        homeSort.homeSortVCStyle = HomeSortVCStyleTableView;
    }
    [self.viewController.navigationController pushViewController:homeSort animated:YES];
    
}

@end
