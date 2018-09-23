//
//  SegmentButtonView.h
//  TradeUnion
//
//  Created by 林郴 on 2017/2/9.
//  Copyright © 2017年 bzunion. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BtnCollectionView;
@protocol BtnCollectionViewDelegate;

@interface BtnCollectionView : UIView

// 按钮集合视图
@property (nonatomic,strong) UICollectionView *btncollectionView;
// 按钮的宽度 长度
@property (nonatomic,assign) CGFloat buttonWidth;
@property (nonatomic,assign) CGFloat buttonHeight;

// 每行几个按钮
@property (nonatomic,assign) NSInteger everyLineNum;

-(instancetype)initWithFrame:(CGRect)frame withEverLineNum:(CGFloat)everyLineNum withImgAndTitleArray:(NSArray *)imgTitleArray withImgRadios:(CGFloat)radios;

@property(nonatomic,strong)id <BtnCollectionViewDelegate> delegate;

@end

/*
 * 代理
 */
@protocol BtnCollectionViewDelegate <NSObject>
@required

-(void)buttonOnClickWithButtonIndex:(NSInteger)index;

@end
