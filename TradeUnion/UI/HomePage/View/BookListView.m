//
//  BookListView.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/13.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BookListView.h"
#import "BookCollectionViewCell.h"
#import "BookReadPageVC.h"

@interface BookListView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) NSDictionary *imgTitleDic;
@property (nonatomic,assign) NSInteger everyLineNum;

@end

@implementation BookListView

static NSString *cell_identy = @"book_cell";

-(instancetype)initWithFrame:(CGRect)frame withListImageAndTitle:(NSDictionary *)ImgTitleDic withEveryLineNum:(NSInteger)everyLineNum{
    if (self = [super initWithFrame:frame]) {
        _everyLineNum = everyLineNum;
        _imgTitleDic = ImgTitleDic;
        [self createCollectionView];        
    }
    return self;
}
#pragma mark -- 主集合视图
-(void)createCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat layoutWidth = (self.width-15*(_everyLineNum+1))/_everyLineNum;
    layout.itemSize = CGSizeMake(layoutWidth,layoutWidth/3*4+25);
    
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = 15;
    
    _bookCollectView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout: layout];
    _bookCollectView.delegate = self;
    _bookCollectView.dataSource = self;
    _bookCollectView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_bookCollectView];
    
    /**
     *  将UICollectionViewCell类的单元格 加上 cell_identy复用标记
     */
    [_bookCollectView registerClass:[BookCollectionViewCell class] forCellWithReuseIdentifier:cell_identy];
}

#pragma mark -- UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BookCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_identy forIndexPath:indexPath];    
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BookReadPageVC *bookRead = [[BookReadPageVC alloc]init];
    [self.viewController.navigationController pushViewController:bookRead animated:YES];
}
@end
