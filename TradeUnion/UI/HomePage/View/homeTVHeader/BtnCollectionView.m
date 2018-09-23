//
//  SegmentButtonView.m
//  TradeUnion
//
//  Created by 林郴 on 2017/2/9.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import "BtnCollectionView.h"
#import "BtnCollectionViewCell.h"

@interface BtnCollectionView () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

// 图片标题数组
@property (nonatomic,strong) NSArray *dataArray;

// 图片圆角
@property (nonatomic,assign) CGFloat radios;

@end

@implementation BtnCollectionView

static NSString *cell_identy = @"cell";

-(instancetype)initWithFrame:(CGRect)frame withEverLineNum:(CGFloat)everyLineNum withImgAndTitleArray:(NSArray *)imgTitleArray withImgRadios:(CGFloat)radios{
    
    if (self = [super initWithFrame:(frame)]) {
        
        self.backgroundColor = [UIColor whiteColor];

        _dataArray = imgTitleArray;
        
        _everyLineNum = everyLineNum;
        
        _radios = radios;
        
        [self createColloctionView];
    }
    return self;
}

-(void)createColloctionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(self.width/_everyLineNum/2, self.width/_everyLineNum/2+30);
    
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = self.width/_everyLineNum/2;
    
    _btncollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout: layout];
    _btncollectionView.delegate = self;
    _btncollectionView.dataSource = self;
    _btncollectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_btncollectionView];
    
    /**
     *  将UICollectionViewCell类的单元格 加上 cell_identy复用标记
     */
    [_btncollectionView registerClass:[BtnCollectionViewCell class] forCellWithReuseIdentifier:cell_identy];
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BtnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_identy forIndexPath:indexPath];
    NSDictionary *dic = _dataArray[indexPath.row];
    cell.imgV.image = [UIImage imageNamed:[dic objectForKey:@"img"]];
    cell.title.text = [dic objectForKey:@"title"];
    [cell.imgV setViewRadios:_radios bouns:YES boderWith:0 boderColor:nil];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
// 点击collectionView
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(buttonOnClickWithButtonIndex:)]) {
        [self.delegate buttonOnClickWithButtonIndex: indexPath.row];
    }
}
//边缘大小
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(15, self.width/_everyLineNum/4, 15, self.width/_everyLineNum/4);
}


@end
